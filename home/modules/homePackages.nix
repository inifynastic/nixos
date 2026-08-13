{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
	# Devloper Tools
	gcc
	valgrind
	ruby
	python3
	cmake
	gnumake
	ninja
	zip
	unzip
	gdb

	# Language Server
	libclang
	pyright
	ruby-lsp
	bash-language-server	
	nil 

	
	# IDE / Text Editors
	qtcreator
	vscode
	emacs-pgtk
	geany
	neovim

	
	# Wayland Desktop
  discord
	
	vivaldi
	tor
	
	thunar
	
	obs-studio
	vlc
	
	libreoffice-fresh

	# Desktop config stuff	
	mako
	fuzzel
	wl-clipboard
	alacritty
	grim
	slurp
	swaybg
	swaylock-effects
	waybar
	wev
	brightnessctl
	wlogout
	
	#Icon themes
	papirus-icon-theme


	# FUN STUFF
	fortune
	cowsay
	cava
	pipes
	cbonsai
	cmatrix
	figlet
	ani-cli	


	# Utils:
	lenovo-legion # hardware util

	curl
	wget
	iw

	# Weird stuff I kind of understand (Flake packages)
	inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
