# `raincloud-installer`

Rain،cloud installer; for now users must register and download the installer from the website. This repo contains a simple flake so NixOS users can run the downloaded installer.

# Usage

Download the _Rain،cloud_ Installer (a.k.a. the _Raincloud Setup Wizard_) from the website, unpack it and execute the installer.

On `nix`(OS) systems (change to correct path where you downloaded the installer):

- flake:
  ```
  nix run github:Rainc1oud/raincloud-installer /path/to/installer-archive.tgz
  ```
- non-flake:
  ```
  nix-shell -E 'with import <nixpkgs> { config.allowUnfree=true; }; (import (fetchTarball "https://github.com/Rainc1oud/raincloud-installer/archive/refs/heads/main.tar.gz" + "/shell.nix"))' --run 'run-raincloud-installer /path/to/installer-archive.tgz'
  ```
