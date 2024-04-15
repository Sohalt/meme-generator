{
  description = "A small utility to create memes from screenshots.";
  inputs.nixpkgs.url = "nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.systems.url = "github:nix-systems/default-linux";
  outputs = {
    self,
    nixpkgs,
    flake-utils,
    systems,
    ...
  }:
    flake-utils.lib.eachSystem (import systems) (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [self.overlays.default];
      };
    in {
      packages = rec {
        inherit (pkgs) meme-generator;
        default = meme-generator;
      };
    })
    // {
      overlays.default = final: prev: {
        meme-generator = final.callPackage ./package.nix {};
      };
    };
}
