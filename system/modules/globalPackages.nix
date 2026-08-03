{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
		vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
		fastfetch
		xwayland-satellite
		os-prober
		htop
		btop
		pavucontrol
		networkmanagerapplet
		lshw
		pciutils
		capitaine-cursors
		mesa-demos
    dmidecode
	];

  fonts.packages = with pkgs; [
		noto-fonts-color-emoji 
		noto-fonts-emoji-blob-bin 
		noto-fonts-monochrome-emoji
		nerd-fonts.jetbrains-mono 
	];
}