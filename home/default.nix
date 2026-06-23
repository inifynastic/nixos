{ config, pkgs, inputs, ... }:
# REMEMBER FLATPAK was added manually
# "flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo" was ran manually
# And sober was installed manually too
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "inifynastic";
  home.homeDirectory = "/home/inifynastic";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.
  
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
	# azure-sdk-for-cpp.cmake
	gcc
	valgrind
	ruby
	python3
	cmake
	gnumake
	ninja
	
	qtcreator
	vesktop
	vscode
	sublime
	geany
	vivaldi
	neovim
	thunar
	obs-studio
	vlc
	libreoffice-fresh
	
	tor
	
	mako
	fuzzel
	wl-clipboard
	alacritty
	grim
	slurp
	swaybg
	eww
	swaylock-effects
	waybar
	wev
	brightnessctl
	wlogout
	
	
	papirus-icon-theme
	# FUN STUFF
	fortune
	cowsay
	cava
	pipes
	cbonsai
	cmatrix
	figlet

	lenovo-legion

	curl
	wget 
	inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "capitaine-cursors";
    size = 24;
    package = pkgs.capitaine-cursors;
};
services.swayidle = {
  enable = true;

  timeouts = [
    {
      timeout = 600;
      command = "swaylock -f";
    }
    {
      timeout = 900;
      command = "niri msg action power-off-monitors";
      resumeCommand = "niri msg action power-on-monitors";
    }
    {
      timeout = 1800;
      command = "systemctl suspend";
    }
  ];

  events = {
    "before-sleep" = "swaylock -f";
  };
};
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
    home.file = {
	".config/niri/config.kdl" = {
		source = ./niri/config.kdl;
		force = true;
	};
	".config/waybar/config.jsonc"={
		source = ./waybar/config.jsonc;
		force = true;
	};
	".config/waybar/style.css"={
		source = ./waybar/style.css;
		force = true;
	};
	".config/alacritty/alacritty.toml"={
		source = ./alacritty/alacritty.toml;
		force = true;
	};
	".config/fuzzel/fuzzel.ini"={
		source = ./fuzzel/fuzzel.ini;
		force = true;
	};
	
};
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/inifynastic/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
	GTK_THEME = "Adwaita:dark";
    	EDITOR = "vim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
