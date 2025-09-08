{ config, pkgs, ... }:
{
  home.username = "joaquin";
  home.homeDirectory = "/home/${config.home.username}";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
  programs.lazydocker.enable = true;
  programs.librewolf.enable = true;

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    XCURSOR_THEME = "Catppuccin-Macchiato-Teal";
    XCURSOR_SIZE = "30";
    HYPRCURSOR_THEME = "Catppuccin-Macchiato-Teal";
    HYPRCURSOR_SIZE = "30";
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
      name = "Catppuccin-Macchiato-Teal";
      package = pkgs.catppuccin-cursors.macchiatoTeal;
    };

    gtk4.extraCss = config.gtk.gtk3.extraCss;
  };

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
    brightnessctl
    catppuccin-cursors.macchiatoTeal
    cliphist
    equibop
    eza
    gcc
    hyprcursor
    hyprpaper
    hyprpicker
    hyprshot
    lazygit
    nerd-fonts.commit-mono
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
