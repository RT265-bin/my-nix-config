{ config, lib, pkgs, ... }:

{
# Use the systemd-boot EFI boot loader.
  #boot.loader.systemd-boot.enable = false;

  boot.loader = {
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot";
    
    grub = {
    enable = true;
    device =  "nodev";
    default = "0";
    efiSupport = true;
    #useOSProber = true;
    extraEntries = ''
                menuentry "Windows" {
                    search --file --no-floppy --set=root /EFI/Microsoft/Boot/bootmgfw.efi
                    chainloader (''${root})/EFI/Microsoft/Boot/bootmgfw.efi
                }
                menuentry "Arch" {
                    search --file --no-floppy --set=root /EFI/BOOT/BOOTX64-Arch.EFI
                    chainloader (''${root})/EFI/BOOT/BOOTX64-Arch.EFI
                }
            '';
    };




  };
  # Use latest kernel.
  #boot.kernelPackages = pkgs.linuxKernel.kernels.linux_zen;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  #boot.kernelPackages = pkgs.linuxPackages_zen;
}
