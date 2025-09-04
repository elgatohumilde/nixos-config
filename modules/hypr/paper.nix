{ ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/.dotfiles/modules/hypr/Wallpapers/background.png" ];
      wallpaper = [ ",~/.dotfiles/modules/hypr/Wallpapers/background.png" ];
    };
  };
}
