{
  description = "Run Rain،cloud Installer";

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true; # for steam-run
    };
  in {
    packages.x86_64-linux.default = import ./rri.nix {inherit pkgs;};
  };
}
