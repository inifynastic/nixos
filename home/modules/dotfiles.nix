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

		"mako"={
			source = ../dotfiles/mako;
			force = true;
		};

		"btop"={
			source = ../dotfiles/btop;
			recursive = true;
			force = true;
		};

		"fish"={
			source = ../dotfiles/fish;
			force = true;
		};

		"fastfetch"={
			source = ../dotfiles/fastfetch;
			force = true;
		};

		"cava"={
			source = ../dotfiles/cava;
			force = true;
			recursive = true;
		};

		"swaylock"={
			source = ../dotfiles/swaylock;
			force = true;
		};

		"wlogout"={
			source = ../dotfiles/wlogout;
			force = true;
			recursive = true;
		};
	};

  xdg.dataFile."resources" = {
		source = ../resources;
		recursive = true;
		force = true;
	};
}