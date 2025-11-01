{ ... }:
{

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/.dotfiles/home/hypr/Wallpapers/background.png" ];
      wallpaper = [ ",~/.dotfiles/home/hypr/Wallpapers/background.png" ];
    };
  };

}
