{ inputs, pkgs-unstable, ... }: {
   imports = [
     inputs.nixCats.homeModule
   ];
   home.packages = with pkgs-unstable; [ lldb ];
   nixCats = {
     enable = true;
     packageDefinitions.merge = {
       nixCats = { ... }: {
         settings.wrapRc = false;
       };
     };
  };
}
