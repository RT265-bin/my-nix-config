{ config, lib, pkgs, ... }:

{
#fix zsh
   programs.zsh = {
     enable = true;
     shellAliases = {
       ll = "ls -l";
       update = "sudo nixos-rebuild switch";
       nixfetch = " fastfetch --logo ~/nixlogo.png";
       vim = "nvim";
       c = "clear";
     };
     #history.size = 10000;
   };

 #bash
  #programs.bash = {
  #enable = true;
  #enableCompletion = true;
  #bashrcExtra = ''
   #export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
  #'';
 # };

}
