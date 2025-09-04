{ config, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "${config.home.homeDirectory}/Pictures/Wallpapers/background.png" ];
      wallpaper = [ ", ${config.home.homeDirectory}/Pictures/Wallpapers/background.png" ];
    };
  };
}
