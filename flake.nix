{
  description = "Inifynity NixOS Configuration";

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
  };

  outputs = { self, nixpkgs, home-manager,  ... }@inputs: 
    let 
	system = "x86_64-linux";
	
	pkgs = import nixpkgs {
		inherit system;
		config.allowUnfree = true;
	};

    in{	
    nixosConfigurations.NixOS = nixpkgs.lib.nixosSystem {
	inherit system;
      specialArgs = {inherit inputs;};
      modules = [
        ./system/configuration.nix
         inputs.home-manager.nixosModules.home-manager
      ];
    };
      devShells.${system}.default = import ./development {inherit pkgs;};
  };
}
