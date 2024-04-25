#    nixpkgs.url = "nixpkgs/nixos-unstable";
#     nixos-hardware.url = "github:NixOS/nixos-hardware/master";
#
#    nixosConfigurations = {
#      tardis = lib.nixosSystem {
#        inherit system;
#        modules = [
# 	./configuration.nix
# 	nixos-hardware.nixosModules.framework-13-7040-amd
# 	];
#       };

{ pkgs, config, ... }: 
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/system
#     nixos-hardware.nixosModules.framework-13-7040-amd
  ];

#   environment.systemPackages = with pkgs; [
#     acpi
#     brightnessctl
#     cpupower-gui
#     powertop
#   ];
#
   services = {
#     # thermald.enable = true;
#     # cpupower-gui.enable = true;
     power-profiles-daemon.enable = true;
     fwupd.enable = true;
   };
#
#     upower = {
#       enable = true;
#       percentageLow = 20;
#       percentageCritical = 5;
#       percentageAction = 3;
#       criticalPowerAction = "PowerOff";
#     };
#
#     auto-cpufreq = {
#       enable = true;
#       settings = {
#         battery = {
#           governor = "performance";
#           turbo = "auto";
#         };
#         charger = {
#           governor = "performance";
#           turbo = "auto";
#         };
#       };
#     };
#   };
#
#   boot = {
#     kernelModules = ["acpi_call"];
#     extraModulePackages = with config.boot.kernelPackages;
#       [
#         acpi_call
#         cpupower
#       ]
#       ++ [pkgs.cpupower-gui];
#   };
 }
