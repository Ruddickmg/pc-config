{ lib, pkgs, pkgs-unstable, system, inputs, ... }: {
  imports = [
    ./ssh.nix
    (import ./desktop { inherit pkgs pkgs-unstable; })
    (import ./media { inherit pkgs; })
    (import ./editors { inherit pkgs-unstable system inputs; })
    (import ./terminal { inherit pkgs lib; })
    (import ./git.nix { inherit pkgs; })
    (import ./surf.nix { inherit pkgs; })
  ];
  home.packages = with pkgs-unstable; [ lldb ];
}
