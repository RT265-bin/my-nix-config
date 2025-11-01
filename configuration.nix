# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = false;

  boot.loader = {
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot";
    
    grub = {
    enable = true;
    device =  "nodev";
    default = "0";
    efiSupport = true;
    #useOSProber = true;
    extraEntries = ''
                menuentry "Windows" {
                    search --file --no-floppy --set=root /EFI/Microsoft/Boot/bootmgfw.efi
                    chainloader (''${root})/EFI/Microsoft/Boot/bootmgfw.efi
                }
                menuentry "Arch" {
                    search --file --no-floppy --set=root /EFI/BOOT/BOOTX64-Arch.EFI
                    chainloader (''${root})/EFI/BOOT/BOOTX64-Arch.EFI
                }
            '';
    };




  };
  # Use latest kernel.
  #boot.kernelPackages = pkgs.linuxKernel.kernels.linux_zen;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  #boot.kernelPackages = pkgs.linuxPackages_zen;



   networking.hostName = "RT265"; # Define your hostname.
  #networkmanager.enable = true;
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
   #networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
   time.timeZone = "Asia/Shanghai";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
   i18n.defaultLocale = "en_US.UTF-8";
   console = {
     font = "Lat2-Terminus16";
  #   keyMap = "us";
     useXkbConfig = true; # use xkb.options in tty.
   };

  # Enable the X11 windowing system.
  #services.xserver.enable = true;
  

 environment.sessionVariables = rec {
     GTK_IM_MODULE = "fcitx";
     QT_IM_MODULE = "fcitx";
     #XMODIFIERS= "@im" = "fcitx";
     SDL_IM_MODULE = "fcitx";
     GLFW_IM_MODULE = "ibus";
    };  

 #fix zsh
   programs.zsh = {
     enable = true;
     #enableCompletion = true;
     #autosuggestions.enable = true;
     #syntaxHighlighting.enable = true;

     shellAliases = {
       ll = "ls -l";
       update = "sudo nixos-rebuild switch";
       nixfetch = " fastfetch --logo ~/nixlogo.png";
     };
     #history.size = 10000;
   #zplug = {
       #enable = true;
       #plugins = [
         #{ name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
         #{ name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } # Installations with additional options. For the list of options, please refer to Zplug README.
         #];
      #};
   };




  # daed
    services.daed = {
                  enable = true;
                   openFirewall = {
                         enable = true;
                         port = 12345;
                   };
                  };


  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
   #services.pulseaudio.enable = true;
  # OR
   services.pipewire = {
     enable = true;
     pulse.enable = true;
   };





  #Enable networkmanager
  networking.networkmanager.enable = true;
  #users.users.RT.exteaGroups = ["networkmanager"];


  #users.users.RT.isNormalUser = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.RT = {
    isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
     home = "/home/RT";
     shell = pkgs.zsh;
     hashedPassword = "$y$j9T$ZoWynvJ.FSKUKSdIsTi2..$FpfedTsron.nTcOZMkLRtdV7spLlRJrShw6TcN0vUj1";
     packages = with pkgs; [
       tree
     ];
   };

 #users.defaultUserShell = pkgs.zsh;

  # programs.firefox.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
   environment.systemPackages = with pkgs; [
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     alacritty
     fastfetch
     ntfs3g
     cava
     btrfs-progs
     cmus
     firefox
     tmux
     htop
     util-linux
     hexo-cli
     git
     #linuxKernel.kernels.linux_zen
     grub2
     dosfstools
     android-tools
     w3m
     pkgs.alsa-utils
     pkgs.brightnessctl
     pkgs.neovide
     mpv
     bluez
     networkmanager
     jp2a
     ffmpeg
     axel
     vlc
     ovh-ttyrec
     zsh
     zsh-completions
     autojump
     pkgs.zimfw
     zsh-autosuggestions
     zsh-syntax-highlighting
     pkgs.zsh-powerlevel10k
     daed
     p7zip
     hyprland
     pkgs.kitty
     sysstat
     lm_sensors # for `sensors` command
     ethtool
     pciutils # lspci
     usbutils # lsusb
     hugo # static site generator
     glow # markdown previewer in terminal
     btop  # replacement of htop/nmon
     iotop # io monitoring
     iftop # network monitoring
     nix-output-monitor
     cowsay
     file
     which
     tree
     gnused
     gnutar
     gawk
     zstd
     gnupg
     zip
     xz
     pkgs.nwg-displays
     pkgs.whois
     unzip
     mtr # A network diagnostic tool
     iperf3
     dnsutils  # `dig` + `nslookup`
     ldns # replacement of `dig`, it provide the command `drill`
     aria2 # A lightweight multi-protocol & multi-source command-line download utility
     socat # replacement of openbsd-netcat
     nmap # A utility for network discovery and security auditing
     ipcalc  # it is a calculator for the IPv4/v6 addresses
     ripgrep # recursively searches directories for a regex pattern
     jq # A lightweight and flexible command-line JSON processor
     yq-go # yaml processor https://github.com/mikefarah/yq
     eza # A modern replacement for ‘ls’
     fzf # A command-line fuzzy finder
     neofetch
     thefuck
   ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

   #enable hyprland
    services.hypridle.enable = true;
  programs.hyprlock.enable = true;
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

    #steam
    programs.steam ={
      enable = true;
      extest.enable = true;
      protontricks.enable = true;

    };




  #enable thefuck
  programs.thefuck.enable = true;

  #enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
     
  # List services that you want to enable:

  #enable bluetooth
  hardware.bluetooth.enable = true;

  #use unfree pkgs
  nixpkgs.config.allowUnfree = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  programs.java.enable = true;
  programs.steam.extraPackages = [ pkgs.jdk ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };
 

   nix.settings.auto-optimise-store = true;




  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

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
 nix.settings.substituters = [ "https://mirror.sjtu.edu.cn/nix-channels/store" ];
  system.stateVersion = "25.05"; # Did you read the comment?

}

