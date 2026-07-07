# INIFYNASTIC's Config
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
	imports = [
		./hardware-configuration.nix
    ];
    system.stateVersion = "25.11";  # DANGER!!!! Lets not touch this for now.

#=========== Hardware ============
	boot.loader ={
	systemd-boot.enable = false;
	efi = {
		canTouchEfiVariables = true;
		};
	grub  = {
		enable = true;
		device = "nodev";
		efiSupport = true;
		useOSProber = true;
	};
};

boot.kernelParams = [
  "ignore_loglevel"
  "initcall_debug"
  "no_console_suspend"
];
	
	hardware.graphics.enable = true;
	services.xserver.videoDrivers = ["nvidia"];
	
	hardware.nvidia = {
		modesetting.enable = true;
		powerManagement.enable = false; # In case my graphic driver gets corrupted
		powerManagement.finegrained = false;
		open = true;
		nvidiaSettings = true;
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

#============= Host, Users and Packages========
	networking.hostName = "NixOS";
	environment.systemPackages = with pkgs; [
		vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
		fastfetch
		xwayland-satellite
		os-prober
		htop
		btop
		pulseaudio
		pavucontrol
		networkmanagerapplet
		lshw
		pciutils
		capitaine-cursors
		mesa-demos
    dmidecode
    netcat-openbsd

    #qtgreet
	];
	fonts.packages = with pkgs; [
		noto-fonts-color-emoji 
		noto-fonts-emoji-blob-bin 
		noto-fonts-monochrome-emoji
		nerd-fonts.jetbrains-mono 
	];
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
	home-manager = {
	useGlobalPkgs = true;
	useUserPackages = true;
	extraSpecialArgs = {inherit inputs;};
		users = {
			"inifynastic" = import ./../home/default.nix;
		};
	};
	programs.fish.enable = true;
	programs.git = {
	enable = true;
	};
	programs.firefox.enable = true;
	nixpkgs.config.allowUnfree = true;
	nixpkgs.overlays = [
  	(final: prev: {
     	niri = inputs.nixpkgs-unstable.legacyPackages.${prev.stdenv.hostPlatform.system}.niri;
    	# qt6 = inputs.nixpkgs-unstable.legacyPackages.${prev.stdenv.hostPlatform.system}.qt6;
	})
  	];
#============= Utilities================
	security.rtkit.enable = true;
	networking.networkmanager.enable = true;
	hardware.bluetooth ={
    enable = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };
	services = {
	gnome.gnome-keyring.enable = true;
	power-profiles-daemon.enable = true;
	flatpak ={
		enable = true;
	};
	pipewire = {
		enable = true;
		pulse.enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		wireplumber.enable = true;
	};
	blueman.enable = true;
	};
	time.timeZone = "Asia/Kathmandu";
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	#services.printing.enable = true;


  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
#------------------------------------------------------------------------------------------------------------------
# DE/WM
programs.niri.enable = true;
programs.regreet.enable = true;
	services = {
		# displayManager.sddm.enable = true;
		# displayManager.sddm.wayland.enable = true;
                greetd.enable = true;
	};

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
 
#------------------------------------------------------------------------------------------------------------------

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  


  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
   

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  
#   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

#----------------------------------------------------------

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .

 }
