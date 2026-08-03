{ ... }:

{
  programs ={
    niri.enable = true;
    regreet.enable = true;
  };
  
	services = {
    greetd.enable = true;
	};
}