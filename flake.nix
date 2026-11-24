{
  description = "A flake for my os";

  inputs = {
    # GitHub's `github:` flake fetcher uses the GitHub API and is rate-limited.
    # These inputs use SSH Git transport so flake updates use the user's GitHub key.
    nixCats.url = "path:/home/moon/.config/nvim";

    "herdr".url = "git+ssh://git@github.com/ogulcancelik/herdr?shallow=1";
    "herdr".inputs."nixpkgs".url = "git+ssh://git@github.com/NixOS/nixpkgs?ref=nixos-unstable&shallow=1";
    "herdr".inputs."rust-overlay".url = "git+ssh://git@github.com/oxalica/rust-overlay?shallow=1";
    "herdr".inputs."rust-overlay".inputs."nixpkgs".follows = "herdr/nixpkgs";
    "home-manager".url = "git+ssh://git@github.com/nix-community/home-manager?ref=release-26.05&shallow=1";
    "home-manager".inputs."nixpkgs".follows = "nixpkgs";
    "nix-jetbrains-plugins".url = "git+ssh://git@github.com/theCapypara/nix-jetbrains-plugins?shallow=1";
    "nix-jetbrains-plugins".inputs."flake-compat".url = "git+ssh://git@github.com/NixOS/flake-compat?shallow=1";
    "nix-jetbrains-plugins".inputs."nixpkgs".url = "git+ssh://git@github.com/NixOS/nixpkgs?ref=nixos-unstable&shallow=1";
    "nix-jetbrains-plugins".inputs."systems".url = "git+ssh://git@github.com/nix-systems/default?shallow=1";
    "nixCats".inputs."nixCats".url = "git+ssh://git@github.com/BirdeeHub/nixCats-nvim?shallow=1";
    "nixCats".inputs."nixpkgs".follows = "nixpkgs-unstable";
    "nixCats".inputs."plugins-budoux.lua".url = "git+ssh://git@github.com/delphinus/budoux.lua?shallow=1";
    "nixCats".inputs."plugins-md-render.nvim".url = "git+ssh://git@github.com/delphinus/md-render.nvim?shallow=1";
    "nixCats".inputs."plugins-treesitter-textobjects".url = "git+ssh://git@github.com/nvim-treesitter/nvim-treesitter-textobjects?ref=main&shallow=1";
    "nixpkgs".url = "git+ssh://git@github.com/nixos/nixpkgs?ref=nixos-26.05&shallow=1";
    "nixpkgs-unstable".url = "git+ssh://git@github.com/nixos/nixpkgs?ref=nixos-unstable&shallow=1";
    "nur".url = "git+ssh://git@github.com/nix-community/nur?shallow=1";
    "nur".inputs."flake-parts".url = "git+ssh://git@github.com/hercules-ci/flake-parts?shallow=1";
    "nur".inputs."flake-parts".inputs."nixpkgs-lib".follows = "nur/nixpkgs";
    "nur".inputs."nixpkgs".url = "git+ssh://git@github.com/nixos/nixpkgs?ref=nixos-unstable&shallow=1";
    "rust-overlay".url = "git+ssh://git@github.com/oxalica/rust-overlay?shallow=1";
    "rust-overlay".inputs."nixpkgs".url = "git+ssh://git@github.com/NixOS/nixpkgs?ref=nixpkgs-unstable&shallow=1";
    "stylix".url = "git+ssh://git@github.com/nix-community/stylix?ref=release-26.05&shallow=1";
    "stylix".inputs."base16".url = "git+ssh://git@github.com/SenchoPens/base16.nix?shallow=1";
    "stylix".inputs."base16".inputs."fromYaml".url = "git+ssh://git@github.com/SenchoPens/fromYaml?shallow=1";
    "stylix".inputs."base16-fish".url = "git+ssh://git@github.com/tomyun/base16-fish?shallow=1";
    "stylix".inputs."base16-helix".url = "git+ssh://git@github.com/tinted-theming/base16-helix?shallow=1";
    "stylix".inputs."base16-vim".url = "git+ssh://git@github.com/tinted-theming/base16-vim?shallow=1";
    "stylix".inputs."firefox-gnome-theme".url = "git+ssh://git@github.com/rafaelmardojai/firefox-gnome-theme?shallow=1";
    "stylix".inputs."flake-parts".url = "git+ssh://git@github.com/hercules-ci/flake-parts?shallow=1";
    "stylix".inputs."flake-parts".inputs."nixpkgs-lib".follows = "stylix/nixpkgs";
    # GNOME Shell main changed Sass variables used by stylix release-26.05's
    # shell_colors.patch, so keep the input on a compatible revision.
    "stylix".inputs."gnome-shell".url = "git+ssh://git@github.com/GNOME/gnome-shell?rev=ef02db02bf0ff342734d525b5767814770d85b49&shallow=1";
    "stylix".inputs."nixpkgs".follows = "nixpkgs";
    "stylix".inputs."nur".url = "git+ssh://git@github.com/nix-community/NUR?shallow=1";
    "stylix".inputs."nur".inputs."flake-parts".follows = "stylix/flake-parts";
    "stylix".inputs."nur".inputs."nixpkgs".follows = "stylix/nixpkgs";
    "stylix".inputs."systems".url = "git+ssh://git@github.com/nix-systems/default?shallow=1";
    "stylix".inputs."tinted-kitty".url = "git+ssh://git@github.com/tinted-theming/tinted-kitty?shallow=1";
    "stylix".inputs."tinted-schemes".url = "git+ssh://git@github.com/tinted-theming/schemes?shallow=1";
    "stylix".inputs."tinted-tmux".url = "git+ssh://git@github.com/tinted-theming/tinted-tmux?shallow=1";
    "stylix".inputs."tinted-zed".url = "git+ssh://git@github.com/tinted-theming/base16-zed?shallow=1";
    "tuios".url = "git+ssh://git@github.com/Gaurav-Gosain/tuios?ref=refs/tags/v0.10.0&shallow=1";
    "tuios".inputs."devshell".url = "git+ssh://git@github.com/numtide/devshell?shallow=1";
    "tuios".inputs."devshell".inputs."nixpkgs".follows = "tuios/nixpkgs";
    "tuios".inputs."flake-compat".url = "git+ssh://git@github.com/nix-community/flake-compat?shallow=1";
    "tuios".inputs."flake-parts".url = "git+ssh://git@github.com/hercules-ci/flake-parts?shallow=1";
    "tuios".inputs."flake-parts".inputs."nixpkgs-lib".follows = "tuios/nixpkgs";
    "tuios".inputs."flake-root".url = "git+ssh://git@github.com/srid/flake-root?shallow=1";
    "tuios".inputs."git-hooks-nix".url = "git+ssh://git@github.com/cachix/git-hooks.nix?shallow=1";
    "tuios".inputs."git-hooks-nix".inputs."flake-compat".follows = "tuios/flake-compat";
    "tuios".inputs."git-hooks-nix".inputs."nixpkgs".follows = "tuios/nixpkgs";
    "tuios".inputs."nix-fast-build".url = "git+ssh://git@github.com/Mic92/nix-fast-build?shallow=1";
    "tuios".inputs."nix-fast-build".inputs."flake-parts".follows = "tuios/flake-parts";
    "tuios".inputs."nix-fast-build".inputs."nixpkgs".follows = "tuios/nixpkgs";
    "tuios".inputs."nix-fast-build".inputs."treefmt-nix".follows = "tuios/treefmt-nix";
    "tuios".inputs."nixpkgs".url = "git+ssh://git@github.com/NixOS/nixpkgs?ref=nixpkgs-unstable&shallow=1";
    "tuios".inputs."treefmt-nix".url = "git+ssh://git@github.com/numtide/treefmt-nix?shallow=1";
    "tuios".inputs."treefmt-nix".inputs."nixpkgs".follows = "tuios/nixpkgs";
    "zen-browser".url = "git+ssh://git@github.com/0xc000022070/zen-browser-flake?shallow=1";
    "zen-browser".inputs."home-manager".follows = "home-manager";
    "zen-browser".inputs."nixpkgs".follows = "nixpkgs-unstable";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      rust-overlay,
      home-manager,
      stylix,
      nur,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-rust = import nixpkgs-unstable {
        inherit system;
        overlays = [
          (import rust-overlay)
        ];
      };
      rustToolChain = (
        pkgs-rust.rust-bin.stable.latest.default.override {
          extensions = [
            "rust-src"
            "cargo"
            "rustc"
            "rust-analyzer"
          ];
        }
      );
    in
    {
      nixosConfigurations.nixos = lib.nixosSystem {
        specialArgs = { inherit nur pkgs-unstable; };
        modules = [
          ./system
          ./configuration.nix
          home-manager.nixosModules.default
          stylix.nixosModules.stylix
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.moon = import ./home.nix;
            home-manager.extraSpecialArgs = {
              inherit
                inputs
                pkgs-unstable
                system
                rustToolChain
                pkgs-rust
                ;
            };
          }
        ];
      };
    };
}
