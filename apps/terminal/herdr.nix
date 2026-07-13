{ inputs, system, ... }:
{
  home.packages = [
    inputs.herdr.packages.${system}.default
  ];
}
