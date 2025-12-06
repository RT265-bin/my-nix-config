{ config, pkgs, ... }:
{ 
   home.username = "RT";
   home.homeDirectory = "/home/RT";
   
  

  imports = [
  ./package/homepackage.nix
  ./fcitx.nix
  ./DE-WM/homehyprland.nix
  ./users/git.nix
  ./waybar.nix
  ];
 
  programs.alacritty = {
  enable = true;
  };


   #dolphin conf
   home.file.".config/menus/applications.menu".source = ./.config/menus/applications.menu;

  #nvim
   #home.file.".config/nvim" = {
    #source = ./.config/nvim;
    #recursive = true;
    #executable = true;  
   #};





   #nix fetch
   home.file."nixlogo.png".source = ./fetchlogo/nixlogo.png;

   
   #rofi
   home.file.".config/rofi" = {
    source = ./rofi;
    recursive = true;
    executable = true;  
   };

  # Optional, hint Electron apps to use Wayland:
  # home.sessionVariables.NIXOS_OZONE_WL = "1";



 home.stateVersion = "25.05";
}
