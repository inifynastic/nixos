# INIFYNASTIC's Config

# Manual = https://search.nixos.org/options 

{ config, lib, pkgs, inputs, ... }:

{
	imports = [
		./hardware-configuration.nix
		
		./modules/audio.nix
		./modules/bluetooth.nix
		./modules/boot.nix
		./modules/desktop.nix
		./modules/misc.nix
		./modules/homeManager.nix
		./modules/globalPackages.nix
		./modules/networking.nix
		./modules/nixSettings.nix
		./modules/nvidia.nix
		./modules/security.nix
		./modules/services.nix
		./modules/users.nix
    ];
    system.stateVersion = "25.11";  # DANGER!!!! Lets not touch this for now.
}

