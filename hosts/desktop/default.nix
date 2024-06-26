# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib,  ... }:

{
  imports =
    [
      ../../modules/system.nix
      ../../modules/syncthing.nix
      ../../modules/windowManager/i3.nix
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot = {
    loader = {
      efi = {
	canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        efiSupport = true;
        device = "nodev";
      };
      timeout = 1;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking.hostName = "x280"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  system.stateVersion = "23.05"; # Did you read the comment?
}
