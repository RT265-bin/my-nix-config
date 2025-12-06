{ config, pkgs, ... }:
{
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
}
