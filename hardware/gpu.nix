{ config, lib, pkgs, ... }:

{
#gpu enable
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs;[
   intel-media-driver
   intel-ocl
   intel-vaapi-driver
   ];


  #amdgpu
  #hardware.amdgpu.amdvlk.enable = true;
  #services.xserver.videoDrivers = [
  #"amdgpu"
  #];
  #hardware.amdgpu.legacySupport.enable = true;
  #hardware.amdgpu.opencl.enable = true;
  #services.frigate.vaapiDriver = [
  #"radeonsi"
  #];






}
