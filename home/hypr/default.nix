{ config, ... }:
{

  imports = [
    ./binds.nix
    ./lock.nix
    ./paper.nix
    ./rules.nix
  ];

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

    extraConfig = ''
      env = HYPRSHOT_DIR,              ${config.home.homeDirectory}/Pictures/Screenshots
      env = LIBVA_DRIVER_NAME,         nvidia
      env = NVD_BACKEND,               direct
      env = XDG_CURRENT_DESKTOP,       Hyprland
      env = XDG_SESSION_DESKTOP,       Hyprland
      env = WLR_NO_HARDWARE_DESKTOP,   1
      env = __GLX_VENDOR_LIBRARY_NAME, nvidia
    '';
  };

}
