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
               doCheck = false;
            };
            lspAndStuff = with pkgs.vimPlugins; [
              lz-n
              nvim-treesitter.withAllGrammars
              nvim-web-devicons
            ];
            myPlugins = lspAndStuff ++ [myLocalConfig];
            myLazyPlugins = with pkgs.vimPlugins; [
              conform-nvim
              trouble-nvim
              nvim-lspconfig
              blink-cmp
            ];
            deps = with pkgs; [
                  wl-clipboard

                  # LSPs
                  nodePackages.vscode-langservers-extracted # Provides 'html' and 'cssls'
                  nodePackages.typescript-language-server   # Provides 'ts_ls' (handles TS/JS/React)

                  # Formatters
                  prettier
                ];

          customNeovim = pkgs.neovim.override {
            configure = {
              customRC = ''
                luafile ${./init.lua}
              '';
              extraMakeWrapperArgs = ''--prefix PATH : "${pkgs.lib.makeBinPath deps}"'';
              packages.myVimPackage = {
                start = myPlugins;
                opt = myLazyPlugins;
              };
              extraPackages = deps;

            };

          };
        in
        {
          packages.default = customNeovim;
        };
    };
}
