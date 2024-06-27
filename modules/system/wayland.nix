{ inputs, pkgs, config, lib, ... }:
{
  xdg.portal.config.common.default = [ "*" ];
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      #pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-kde
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
