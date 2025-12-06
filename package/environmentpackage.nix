 { config, lib, pkgs, ... }:

{


#use unfree pkgs
  nixpkgs.config.allowUnfree = true;


   environment.systemPackages = with pkgs; [
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     neovim
     wget
     alacritty
     fastfetch
     ntfs3g
     cava
     xorg.libxshmfence
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
     nodejs_22
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
}
