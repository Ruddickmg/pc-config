{
  description = "A flake for my os";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nix-jetbrains-plugins.url = "github:theCapypara/nix-jetbrains-plugins";
    nixCats.url = "path:/home/moon/.config/nvim";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, stylix, ... } @inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs-unstable = import nixpkgs-unstable {
        system = system;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations.nixos = lib.nixosSystem {
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
              inherit inputs pkgs-unstable system;
            };
          }
        ];
      };
    };
}
