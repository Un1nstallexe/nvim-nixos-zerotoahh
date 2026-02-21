{
  description = "Custom Neovim environment without abstractions";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ self, nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

      perSystem = { config, self', system, pkgs, ... }:
        let
          myLocalConfig = pkgs.vimUtils.buildVimPlugin {
              name = "my-local-config";
              src = ./.; # Grabs everything in the current git tree, including your `lua/` folder
            };
            myPlugins = with pkgs.vimPlugins; [

            ] ++ [myLocalConfig];

          customNeovim = pkgs.neovim.override {
            configure = {
              customRC = ''
                luafile ${./init.lua}
              '';

              packages.myVimPackage = {
                start = myPlugins;
                opt = [];
              };
            };
          };
        in
        {
          packages.default = customNeovim;
        };
    };
}
