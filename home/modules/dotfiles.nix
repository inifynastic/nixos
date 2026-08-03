{ ... }:

{
  home.file = {
	".config/niri/config.kdl" = {
		source = ../dotfiles/niri/config.kdl;
		force = true;
	};
	".config/waybar/config.jsonc"={
		source = ../dotfiles/waybar/config.jsonc;
		force = true;
	};
	".config/waybar/style.css"={
		source = ../dotfiles/waybar/style.css;
		force = true;
	};
	".config/alacritty/alacritty.toml"={
		source = ../dotfiles/alacritty/alacritty.toml;
		force = true;
	};
	".config/fuzzel/fuzzel.ini"={
		source = ../dotfiles/fuzzel/fuzzel.ini;
		force = true;
	};
  };
}