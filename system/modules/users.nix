{ pkgs, ... }:

{
  users.users.inifynastic = {
		isNormalUser = true;
		shell = pkgs.fish;
		extraGroups = [ "wheel" ];
		# packages = with pkgs; [
		# 	tree
		#	geany
		#	cmake
		#	ruby
		#	vivaldi
		#	discord
     		#];
   };

  programs ={
    fish.enable = true;
    git = {
    enable = true;
    };
    firefox.enable = true;
  };
}