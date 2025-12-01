{
  description = "A flake for my os";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    ff-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-jetbrains-plugins.url = "github:theCapypara/nix-jetbrains-plugins";
    nixCats.url = "path:/home/moon/.config/nvim";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, stylix, ff-addons, ... } @inputs:
    let
      system = "x86_64-linux";
      firefox-addons = ff-addons.packages."${system}";
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
          home-manager.nixosModules.default
          stylix.nixosModules.stylix
           {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.moon = import ./home.nix;
            home-manager.extraSpecialArgs = {
              inherit inputs pkgs-unstable system firefox-addons;
            };
          }
        ];
      };
    };
}
