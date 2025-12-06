{ config, lib, pkgs, ... }:

{
 #steam
    programs.steam ={
      enable = true;
      extest.enable = true;
      protontricks.enable = true;

    };
 programs.steam.extraPackages = [ pkgs.jdk ];
}