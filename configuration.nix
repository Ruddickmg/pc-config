# Edit this configuration file to define what should be installed on
# your system.  Help is available in the default.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, nur, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  hardware.enableRedistributableFirmware = true;

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  # - Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # - Something to do with nixd formatter
  #  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Tailscale VPN
  services.tailscale.enable = true;
  networking.firewall.allowedUDPPorts = [ 41641 ];

  # Set your time zone.
  time.timeZone = "Pacific/Honolulu";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable docker
  virtualisation.docker.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
  services.libinput.touchpad.middleEmulation = true;
  services.libinput.touchpad.tapping = true;

  # Add groups
  users = {
    groups.moon = {
      name = "moon";
      members = [ "moon" ];
    };

    users.moon = {
      isNormalUser = true;
      description = "moon";
      extraGroups = [
        "moon"
        "networkmanager"
        "wheel"
        "docker"
        "video"
        "audio"
      ];
    };
  };

  # Install firefox.
  programs.firefox.enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [ nur.overlays.default ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  nix.optimise.automatic = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = (
    with pkgs;
    [
      docker
      claude-code
      nixd
      nixfmt
    ]
  );

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  security.pam.services = {
    greetd.enableGnomeKeyring = true;
    greetd-password.enableGnomeKeyring = true;
    login.enableGnomeKeyring = true;
  };
  services.gnome.gnome-keyring = {
    enable = true;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man default.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

  # use system files for autocomplete
  environment.pathsToLink = [ "/share/zsh" ];

  # Shortcuts
  environment.shellAliases = {
    audio = "pulsemixer";
    metrics = "btop";
    rebuild = "sudo nixos-rebuild switch --flake ~/Nixos";
    update = "nix flake update --flake ~/Nixos";
    refresh = "update && rebuild";
  };

  environment.variables = {
    SSH_ASKPASS_REQUIRE = "prefer";
  };
}
