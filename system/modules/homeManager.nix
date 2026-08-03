{ inputs, ... }:

{
  home-manager = {
	useGlobalPkgs = true;
	useUserPackages = true;
	extraSpecialArgs = {inherit inputs;};
		users = {
			"inifynastic" = import ../../home/default.nix;
		};
	};
}