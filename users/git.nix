{ config, pkgs, ... }:
{ 
  #config of git
   programs.git = {
     enable = true;
     userName = "RT265-bin";
     userEmail = "t2976376589@outlook.com";
   };
 
}