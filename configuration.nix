{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware/hardware-configuration.nix
      ./users/user.nix
      ./boot.nix
      ./hardware/ucode.nix
      ./hardware/gpu.nix
      ./package/environmentpackage.nix
      ./shell.nix
      ./DE-WM/hyprland.nix
      ./environment.nix
      ./daed.nix
      ./rubbish.nix
      ./steam.nix
    ];



   networking.hostName = "RT265"; # Define your hostname.
   networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
   time.timeZone = "Asia/Shanghai";

  # Select internationalisation properties.
   i18n.defaultLocale = "en_US.UTF-8";
   console = {
     font = "Lat2-Terminus16";
     useXkbConfig = true; # use xkb.options in tty.
   };


  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
   services.pipewire = {
     enable = true;
     pulse.enable = true;
   };




  #enable xdg-menus
  xdg.menus.enable = true;


  #enable thefuck
  programs.thefuck.enable = true;

  #enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
     
  #enable bluetooth
  hardware.bluetooth.enable = true;

  #enable java
  programs.java.enable = true;
 

 
 nix.settings.substituters = [ "https://mirror.sjtu.edu.cn/nix-channels/store" ];
  system.stateVersion = "25.05";

}

