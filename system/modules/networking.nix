{ ... }:

{
  networking.hostName = "NixOS";

  networking.networkmanager.enable = true;
  
  networking.firewall.allowedTCPPorts = [ 
    5555 
    ];
}