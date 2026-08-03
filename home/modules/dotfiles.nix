{ ... }:

{

	xdg.configFile = {

		"niri" = {
			source = ../dotfiles/niri;
			recursive = true;
			force = true;
		};
		
		"waybar"={
			source = ../dotfiles/waybar;
			force = true;
			recursive = true;
		};

		"alacritty"={
			source = ../dotfiles/alacritty;
			force = true;
		};

		"fuzzel"={
			source = ../dotfiles/fuzzel;
			force = true;
		};
	};

  xdg.dataFile."resources" = {
		source = ../resources;
		recursive = true;
		force = true;
	};
}