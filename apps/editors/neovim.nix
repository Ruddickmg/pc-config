{ inputs, pkgs-unstable, ... }:
{
  imports = [
    inputs.nixCats.homeModule
  ];
  nixCats = {
    enable = true;
    packageDefinitions.merge = {
      nixCats =
        { ... }:
        {
          settings.wrapRc = false;
        };
    };
  };
}
