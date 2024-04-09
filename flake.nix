{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { 
          inherit system; 
        }; 
     in
      {
        devShells.default = pkgs.mkShell {
          LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib}/lib/";
          nativeBuildInputs = with pkgs; [
            esphome
          ];
        };
      });
}
