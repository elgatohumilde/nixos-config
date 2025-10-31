{ config, ... }:
{

  home.file."${config.xdg.configHome}/waybar".source = ./config;

  programs.waybar = {
    enable = true;
  };

}
