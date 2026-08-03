{ config, pkgs, inputs, ... }:
# REMEMBER FLATPAK was added manually
# "flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo" was ran manually
# And sober was installed manually too
{
  imports = [
		./modules/dotfiles.nix
    ./modules/homePackages.nix
    ./modules/misc.nix
    ./modules/session.nix
    ];
  home.username = "inifynastic";
  home.homeDirectory = "/home/inifynastic";

  home.stateVersion = "25.11"; # Do not change unless u wanna break everything

  programs.home-manager.enable = true;
}
