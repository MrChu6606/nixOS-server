{
  description = "NixOS server config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };

  in {
    nixosConfigurations.server = nixpkgs.lib.nixosSystem {
      inherit system pkgs;

      modules = [
        ./modules/hardware.nix
        ./modules/packages.nix
        ./modules/misc.nix
        ./modules/shell.nix
        ./modules/users.nix
      ];
    };
  };
}
