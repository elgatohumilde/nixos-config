{ config, pkgs, ... }:
{
  home.username = "joaquin";
  home.homeDirectory = "/home/${config.home.username}";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.commit-mono
    firefox
    eza
    zoxide
    lazygit
  ];

  imports = [
    ./modules
  ];
}
