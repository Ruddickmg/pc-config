{
  description = "A flake for my os";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nix-jetbrains-plugins.url = "github:theCapypara/nix-jetbrains-plugins";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nix-jetbrains-plugins, home-manager, stylix, nix-colors, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs { system = system; };
      pkgs-unstable = import nixpkgs-unstable {
        system = system;
        config.allowUnfree = true;
      };
      jetbrains-plugins = nix-jetbrains-plugins;
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit nix-colors; };
        modules = [
          ./system
          ./configuration.nix
          home-manager.nixosModules.home-manager
          stylix.nixosModules.stylix
           {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.moon = import ./home.nix;
            home-manager.extraSpecialArgs = {
              inherit pkgs-unstable;
              inherit jetbrains-plugins;
              inherit system;
            };
          }
        ];
      };
    };
}
