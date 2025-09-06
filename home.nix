{ config, pkgs, ... }:
{
  home.username = "joaquin";
  home.homeDirectory = "/home/${config.home.username}";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
  programs.lazydocker.enable = true;
  programs.librewolf.enable = true;

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
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
