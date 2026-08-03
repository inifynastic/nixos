{ ... }:

{
  	services = {
      gnome.gnome-keyring.enable = true;

      power-profiles-daemon.enable = true;
      
      flatpak ={
      enable = true;
      };
	};
}