{ config, lib, pkgs, ... }:

{
#ucode
  hardware.cpu.intel.updateMicrocode = true;
  #hardware.cpu.amd.updateMicrocode = true;
}
