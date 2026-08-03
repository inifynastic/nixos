{ config, ... }:

{
  hardware ={
    graphics.enable = true;
    
    nvidia = {
      modesetting.enable = true;

      powerManagement.enable = false; # In case my graphic driver gets corrupted
      powerManagement.finegrained = false;
      
      open = true;
      nvidiaSettings.enable = true;

      package = config.boot.kernelPackages.nvidiaPackages.stable;
      
      prime = {
        #sync.enable = true;
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        
        nvidiaBusId = "PCI:1:0:0";
        amdgpuBusId = "PCI:6:0:0";
      };
    };
  };
  services.xserver.videoDrivers = ["nvidia"];
}