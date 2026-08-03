{ ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = false;

      efi = {
        canTouchEfiVariables = true;
      };

      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
      };
    };

    kernelParams = [
      # "ignore_loglevel"
      # "initcall_debug"
      # "no_console_suspend"
      # "pcie_port_pm=off"
    ];
  };
}