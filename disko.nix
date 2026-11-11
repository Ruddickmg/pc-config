# Disk layout for a fresh NixOS install (LUKS2 + LVM + btrfs).
#
# This file is standalone: it is NOT imported into the flake, so building the
# current system is unaffected. It is only used on install day, run from the
# installer USB (never from the running system - it wipes the target disk).
#
# Install workflow (on the new laptop):
#   1. Boot the NixOS installer USB and clone this repo.
#   2. Check the target disk name: `lsblk --fs` (update `device` below if it
#      is not /dev/nvme0n1).
#   3. sudo nix run github:nix-community/disko -- --mode destroy,format,mount ./disko.nix
#      (prompts for the LUKS passphrase, then formats and mounts under /mnt)
#   4. nixos-generate-config --root /mnt
#   5. sudo nixos-install --flake .#nixos
#
# Layout (sizes assume a ~1TB disk):
#   nvme0n1 (GPT)
#   |- ESP 2G             vfat -> /boot (plain, systemd-boot)
#   `- LUKS2 "crypt"      one passphrase unlocks everything below
#      `- LVM vg
#         |- swap 33G     raw swap: hibernation target (>= 32G RAM), prio 10
#         |               (zram at prio 100 fills first - see configuration.nix)
#         |- data 95%FREE btrfs with subvolumes root/nix/var/home
#         `- ~5% spare    emergency reserve the filesystem cannot eat;
#                        recover with: lvextend -rL +40G /dev/vg/data
let
  btrfsOpts = [ "compress=zstd" "noatime" "discard=async" ];
in
{
  disko.devices = {
    disk.main = {
      # Verify with `lsblk --fs` on the target machine before running disko.
      device = "/dev/nvme0n1";
      type = "disk";
      content = {
        type = "gpt";
        partitions = {
          boot = {
            priority = 1;
            size = "2G";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "fmask=0077" "dmask=0077" ];
            };
          };
          crypt = {
            priority = 2;
            size = "100%";
            content = {
              type = "luks";
              name = "crypt";
              settings.allowDiscards = true; # TRIM through to the NVMe
              content = {
                type = "lvm_pv";
                vg = "vg";
              };
            };
          };
        };
      };
    };

    lvm_vg.vg = {
      type = "lvm_vg";
      lvs = {
        swap = {
          priority = 1;
          # >= RAM size so the hibernation image always fits.
          size = "33G";
          content = {
            type = "swap";
            priority = 10; # below zram (100), so zram fills first
            resumeDevice = true; # hibernation image target (skips zram)
          };
        };
        data = {
          priority = 2;
          # 95%FREE leaves ~5% of the VG unallocated as an emergency reserve.
          size = "95%FREE";
          content = {
            type = "btrfs";
            extraArgs = [ "-L" "nixos" ];
            subvolumes = {
              root = {
                mountpoint = "/";
                mountOptions = btrfsOpts;
              };
              nix = {
                mountpoint = "/nix";
                mountOptions = btrfsOpts;
              };
              var = {
                mountpoint = "/var";
                mountOptions = btrfsOpts;
              };
              home = {
                mountpoint = "/home";
                mountOptions = btrfsOpts;
              };
            };
          };
        };
      };
    };
  };
}
