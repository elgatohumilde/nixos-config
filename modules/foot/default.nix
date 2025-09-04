{ pkgs, ... }:
{
  programs.foot = {
    enable = true;
    server.enable = false;

    settings = {

      main = {
        shell = "${pkgs.fish}/bin/fish";
        font = "CommitMono Nerd Font Mono:size=16";
      };

      colors = {
        foreground = "e4e4e4";
        background = "181818";

        selection-foreground = "f4f4ff";
        selection-background = "453d41";

        regular0 = "181818";
        regular1 = "f43841";
        regular2 = "73d936";
        regular3 = "ffdd33";
        regular4 = "96a6c8";
        regular5 = "9e95c7";
        regular6 = "95a99f";
        regular7 = "f5f5f5";

        bright0 = "52494e";
        bright1 = "f43841";
        bright2 = "73d936";
        bright3 = "ffdd33";
        bright4 = "96a6c8";
        bright5 = "9e95c7";
        bright6 = "95a99f";
        bright7 = "ffffff";
      };

      bell.system = "no";
    };
  };
}
