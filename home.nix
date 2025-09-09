{ config, pkgs, ... }:
{
  home.username = "joaquin";
  home.homeDirectory = "/home/${config.home.username}";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
  programs.lazydocker.enable = true;
  programs.librewolf.enable = true;

  fonts.fontconfig.enable = true;

  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
  };

  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "30";
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };

  gtk = {
    enable = true;
    theme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyonight-gtk-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };

    gtk4.extraCss = config.gtk.gtk3.extraCss;
  };
  xdg.portal.config.common.default = "*";

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      font-name = "CommitMono Nerd Font Propo 12";
      color-scheme = "prefer-dark";
    };
  };

  home.file = {
    ".local/bin/powermenu" = {
      executable = true;
      text = ''
         #!/bin/sh

        CHOSEN=$(printf "Lock\nSuspend\nReboot\nShutdown\nLog Out" | rofi -dmenu -sync -i -p "Choose")

        case "$CHOSEN" in
            "Lock"    ) hyprctl dispatch exec hyprlock ;;
            "Suspend" ) systemctl suspend-then-hibernate ;;
            "Reboot"  ) reboot ;;
            "Shutdown") poweroff ;;
            "Log Out" ) hyprctl dispatch exit ;;
            *) exit 1 ;;
        esac
      '';
    };
  };

  home.packages = with pkgs; [
    bibata-cursors
    brightnessctl
    cliphist
    equibop
    eza
    gcc
    hyprpaper
    hyprpicker
    hyprshot
    lazygit
    nerd-fonts.commit-mono
    osu-lazer-bin
    pamixer
    pavucontrol
    playerctl
    unzip
    wl-clipboard
    zoxide
  ];

  imports = [
    ./modules
  ];
}
