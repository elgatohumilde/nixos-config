{ ... }:
{
  programs.hyprlock = {
    enable = true;

    settings = {
      background = {
        blur_passes = 3;
        blur_size = 4;
        brightness = 0.8000;
        contrast = 1.3000;
        vibrancy = 0.2100;
        vibrancy_darkness = 0.0;
      };

      input-field = {
        check_color = "rgb(fab387)";
        dots_center = true;
        dots_rounding = -1;
        dots_size = 0.26;
        dots_spacing = 0.15;
        fade_on_empty = true;
        fail_color = "rgb(f38ba8)";
        font_color = "rgb(cdd6f4)";
        halign = "center";
        hide_input = false;
        inner_color = "rgb(11111b)";
        outer_color = "rgb(11111b)";
        outline_thickness = 3;
        position = "0, 75";
        rounding = -1;
        size = "250, 50";
        valign = "bottom";
      };
    };

    extraConfig = ''
      label {
        color = rgb(cba6f7)
          font_family = RobotoMono Nerd Font
          font_size = 64
          halign = center
          position = 0, 60
          text = cmd[update:1000] echo $(date +"%H:%M:%S")
          valign = center
      }

      label {
        color = rgb(cdd6f4)
          font_family = RobotoMono Nerd Font
          font_size = 24
          halign = center
          position = 0, -16
          text = cmd[update:1000] echo $(date +"%A, %d %B %Y")
          valign = center
      }

      label {
        color = rgb(cdd6f4)
          font_family = RobotoMono Nerd Font Mono
          font_size = 30
          halign = center
          position = 0, 30
          text = 
          valign = bottom
      }
    '';
  };
}
