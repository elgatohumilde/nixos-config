{ ... }:
{
  programs.zathura = {
    enable = true;

    options = {
      database = "sqlite";
      font = "CommitMono Nerd Font 14";
      highlight-active-color = "rgba(255,255,255,0)";
      highlight-color = "rbga(255,255,255,0)";
      recolor = true;
      recolor-darkcolor = "#EBDBB2";
      recolor-keephue = true;
      recolor-lightcolor = "#0F111A";
      recolor-reverse-video = true;
      scroll-step = 50;
      selection-clipboard = "clipboard";
      synctex = true;
    };
    extraConfig = ''
      map F follow
      map [fullscreen] F follow
      map f toggle_fullscreen
      map [fullscreen] f toggle_fullscreen
      map R recolor
      map [fullscreen] R recolor
    '';
  };
}
