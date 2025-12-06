{ config, pkgs, ... }:
{ 
  #hyprland
  programs.kitty.enable = true; # required for the default Hyprland config
  home.file.".config/hypr" = {
      source = ../hypr;
      recursive = true;
      executable = true;  
  };
  wayland.windowManager.hyprland.enable = true; # enable Hyprland


  #hypr cursors
   home.file.".local/share/icons" = {
   source = ../.config/icons;
   recursive = true;
   executable = true;  
   };

}
