{ config, ... }:
{
  imports = [
    ./binds.nix
    ./lock.nix
    ./paper.nix
    ./rules.nix
  ];

  home.sessionVariables = {
    HYPRCURSOR_THEME = "24";
    HYPRCURSOR_SIZE = "24";
    HYPRSHOT_DIR = "${config.home.homeDirectory}";
    LIBVA_DRIVER_NAME = "nvidia";
    NVD_BACKEND = "direct";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    WLR_NO_HARDWARE_DESKTOP = "1";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;

    xwayland.enable = true;

    settings = {
      monitor = [ ",preferred,auto,1" ];

      exec-once = [
        "mako"
        "waybar"
        "hyprpaper"
        "wl-clipboard-history -t"
        "wl-paste --watch cliphist store"
      ];

      general = {
        border_size = 2;
        resize_on_border = true;
      };

      animations.enabled = false;
      xwayland.force_zero_scaling = true;

      input = {
        kb_layout = "latam";
        kb_options = "caps:swapescape";

        follow_mouse = 0;

        repeat_rate = 40;
        repeat_delay = 100;
      };

      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
      };

      misc.disable_hyprland_logo = true;
    };
  };
}
