{ config, pkgs, ... }:
{ 
   home.username = "RT";
   home.homeDirectory = "/home/RT";
   
  

   home.packages = with pkgs;[

     texliveFull
     texstudio
     pkgs.viu
     pkgs.obs-studio
     mako
     mpvpaper
     #hyprpaper
     hyprlock
     pkgs.hyprshot
     pkgs.hyprlang
     pkgs.hyprgraphics
     pkgs.hyprland-protocols
     pkgs.hyprutils
     pkgs.xdg-desktop-portal-hyprland
     wlogout
     fuzzel
     waybar
     pkgs.bilibili
     qq
     osu-lazer
     zsh
     zsh-completions
     autojump
     zsh-autosuggestions
     zsh-syntax-highlighting
     zimfw
     listen1
     wechat
     hmcl
     wofi
     rofi
     #proton-ge-bin
     protontricks
     #wine
     xdg-user-dirs
     xdg-utils
     kdePackages.kservice
     nnn
     wl-clipboard
     pkgs.cliphist
     libsForQt5.polkit-kde-agent
     pkgs.kdePackages.dolphin
     pkgs.source-han-sans-vf-ttf
     pkgs.fira-code-symbols
     pkgs.nerd-fonts.hack
     #pkgs.fcitx5-rime
     #pkgs.fcitx5
     pkgs.xorg.xev
     wineWowPackages.stable
     #wine
     #(wine.override { wineBuild = "wine64"; })
     #wine64
     #wineWowPackages.staging
     winetricks
     #pkgs.wineWowPackages.waylandFull
     pkgs.protonup-ng
     steam
     imagemagick
     fim
     #jdk8
     #jdk11
     #jdk17
     #jdk21
     #jdk24
     pkgs.swww
   ];

    #steam
    #programs.steam ={
      #enable = true;
      #extest.enable = true;
      #protontricks.enable = true;

    #};




   #config of git
   programs.git = {
     enable = true;
     userName = "RT265-bin";
     userEmail = "t2976376589@outlook.com";
   };
 
  programs.alacritty = {
  enable = true;
  };


  #fcitx5
   i18n.inputMethod = {
       type = "fcitx5";
       enable = true;
       fcitx5.addons = with pkgs; [
         fcitx5-gtk             # alternatively, kdePackages.fcitx5-qt
         fcitx5-chinese-addons  # table input method support
         fcitx5-nord            # a color theme
         fcitx5-rime
         fcitx5-pinyin-moegirl
       ];
     };





  #programs.bash = {
  #enable = true;
  #enableCompletion = true;
  #bashrcExtra = ''
   #export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
  #'';
 # };





   #dolphin conf
   #home.file.".config/menus/applications.menus" = ./.config/menus/applications.menu;



   #fcitx5 config
   home.file.".local/share/fcitx5" = {
   source = ./.config/fcitx5;
   recursive = true;
   executable = true;  


   };




   #hypr cursors
   home.file.".local/share/icons" = {
   source = ./.config/icons;
   recursive = true;
   executable = true;  


   };






   #nix fetch
   home.file."nixlogo.png".source = ./fetchlogo/nixlogo.png;

   
   #rofi
   home.file.".config/rofi" = {
    source = ./rofi;
    recursive = true;
    executable = true;  
   #home.file."~/.local/share/rofi/themes/rounded-nord-dark.rasi".source = ./rofi/themes/rounded-nord-dark.rasi;
   #home.file."~/.local/share/rofi/themes/rounded-common.rasi".source = ./rofi/themes/rounded-common.rasi;
   };


   #waybar
   programs.waybar.enable = true;
   xdg.configFile."waybar/config.jsonc".source = ./waybar/config.jsonc;
   xdg.configFile."waybar/style.css".source = ./waybar/style.css;
  
  #hyprland
  programs.kitty.enable = true; # required for the default Hyprland config
  home.file.".config/hypr" = {
      source = ./hypr;
      recursive = true;
      executable = true;  
  };
  wayland.windowManager.hyprland.enable = true; # enable Hyprland
  


  # Optional, hint Electron apps to use Wayland:
  # home.sessionVariables.NIXOS_OZONE_WL = "1";












 home.stateVersion = "25.05";
}
