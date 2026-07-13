{
  description = "A flake for my os";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    awww.url = "git+https://codeberg.org/LGFae/awww";
    ff-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-jetbrains-plugins.url = "github:theCapypara/nix-jetbrains-plugins";
    nixCats.url = "path:/home/moon/.config/nvim";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay.url = "github:oxalica/rust-overlay";
    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      rust-overlay,
      home-manager,
      stylix,
      ff-addons,
      awww,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      firefox-addons = ff-addons.packages."${system}";
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
        specialArgs = { inherit awww; };
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
                firefox-addons
                rustToolChain
                pkgs-rust
                ;
            };
          }
        ];
      };
    };
}
