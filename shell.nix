{pkgs ? import <nixpkgs> {config.allowUnfree = true;}}:
pkgs.mkShell {
  packages = [(import ./rri.nix {inherit pkgs;})];
}
