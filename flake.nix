{
  description = "A flake for my os";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nur.url = "github:nix-community/nur";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.home-manager.follows = "home-manager";
    };
    nix-jetbrains-plugins.url = "github:theCapypara/nix-jetbrains-plugins";
    nixCats = {
      url = "path:/home/moon/.config/nvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    herdr.url = "github:ogulcancelik/herdr";
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
        specialArgs = { inherit nur; };
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
