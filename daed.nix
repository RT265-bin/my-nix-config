{ config, lib, pkgs, ... }:

{
 # daed
    services.daed = {
                  enable = true;
                   openFirewall = {
                         enable = true;
                         port = 12345;
                   };
                  };
}