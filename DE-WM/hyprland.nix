{ config, lib, pkgs, ... }:

{

 #enable hyprland
    services.hypridle.enable = true;
  programs.hyprlock.enable = true;
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
}