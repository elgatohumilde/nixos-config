{ pkgs, ... }:
{

  imports = [ ./hardware ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "America/Lima";
  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "la-latin1";
  };

  networking.hostName = "nixos";
  users.users.joaquin = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  environment.localBinInPath = true;
  environment.systemPackages = with pkgs; [ vim ];

  hardware.bluetooth.enable = true;
  networking.networkmanager.enable = true;
  services.libinput.enable = true;
  services.openssh.enable = true;

  system.stateVersion = "25.05";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  programs.hyprland.enable = true;

  hardware.opentabletdriver.enable = true;
  services.blueman.enable = true;

  services.zerotierone.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

}
