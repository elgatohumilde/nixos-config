{ config, pkgs, ... }:
{

  home.file."${config.xdg.configHome}/rofi".source = ./config;

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };

}
