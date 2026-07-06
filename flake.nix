{
  description = "I use Flakes, btw";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgsveryold.url = "github:nixos/nixpkgs?ref=nixos-24.11";
  };

  outputs = { nixpkgs, nixpkgsveryold, ... }@inputs: {
      nixosConfigurations = {
          nixos-btw = nixpkgs.lib.nixosSystem {
              system = "x86_64-linux";

              specialArgs = { inherit inputs; };

              modules = [
                ./configuration.nix
                ./hardware-configuration.nix
        ];
      };
    };
  };
} 
