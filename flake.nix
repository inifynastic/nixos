{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
       url = "github:nix-community/home-manager/release-26.05";
       inputs.nixpkgs.follows = "nixpkgs";
     };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #niri-wm = {
#	url = "git@github:niri-wm/niri";
#	inputs.nixpkgs.follows = "nixpkgs-unstable";
#	};
  };

  outputs = { self, nixpkgs, home-manager,  ... }@inputs: {
    nixosConfigurations.NixOS = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./system/configuration.nix
         inputs.home-manager.nixosModules.home-manager
      ];
    };
  };
}
