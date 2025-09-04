{ ... }:
{
  wayland.windowManager.hyprland.settings =
    let
      mainMod = "SUPER";
      F_terminal = "foot -a F_window";
      TMUX_F_terminal = "${F_terminal} tmux new-session -A -s main";
      TMUX_terminal = "${terminal} tmux new-session -A -s main";
      browser = "firefox";
      cliphist = ''cliphist list | rofi -dmenu -sync -p "Clipboard" | cliphist decode | wl-copy'';
      dotfiles = "${F_terminal} -D ~/.dotfiles -e lazygit --git-dir ~/.dotfiles/.git";
      fileManager = "${F_terminal} -e nvim .";
      menu = ''rofi -show-icons -display-drun "Select" -show drun'';
      terminal = "foot";
    in
    {
      bind = [

        ",      Print, exec, hyprshot -m output -m eDP-1"
        "SHIFT, Print, exec, hyprshot -m region -z"

        "${mainMod},            Q, exec, ${terminal}"
        "${mainMod} CTRL,       Q, exec, ${F_terminal}"
        "${mainMod} SHIFT,      Q, exec, ${TMUX_terminal}"
        "${mainMod} CTRL SHIFT, Q, exec, ${TMUX_F_terminal}"

        "${mainMod}, F, fullscreen,"
        "${mainMod}, C, killactive,"
        "${mainMod}, M, exit,"

        "${mainMod},       B, exec,           ${browser}"
        "${mainMod},       O, exec,           ${dotfiles}"
        "${mainMod},       E, exec,           ${fileManager}"
        "${mainMod},       V, togglefloating,"
        "${mainMod},       R, exec,           ${menu}"
        "${mainMod},       W, exec,           ${cliphist}"
        "${mainMod} SHIFT, M, exec,           powermenu"

        "${mainMod},       P, exec, hyprlock"
        "${mainMod} SHIFT, L, exec, hyprpicker -a"
        "${mainMod} SHIFT, R, exec, pkill waybar && exec waybar"

        "${mainMod}, H, movefocus, l"
        "${mainMod}, L, movefocus, r"
        "${mainMod}, K, movefocus, u"
        "${mainMod}, J, movefocus, d"

        "${mainMod}, 1, workspace, 1"
        "${mainMod}, 2, workspace, 2"
        "${mainMod}, 3, workspace, 3"
        "${mainMod}, 4, workspace, 4"
        "${mainMod}, 5, workspace, 5"
        "${mainMod}, 6, workspace, 6"
        "${mainMod}, 7, workspace, 7"
        "${mainMod}, 8, workspace, 8"
        "${mainMod}, 9, workspace, 9"
        "${mainMod}, 0, workspace, 10"

        "${mainMod} SHIFT, 1, movetoworkspace, 1"
        "${mainMod} SHIFT, 2, movetoworkspace, 2"
        "${mainMod} SHIFT, 3, movetoworkspace, 3"
        "${mainMod} SHIFT, 4, movetoworkspace, 4"
        "${mainMod} SHIFT, 5, movetoworkspace, 5"
        "${mainMod} SHIFT, 6, movetoworkspace, 6"
        "${mainMod} SHIFT, 7, movetoworkspace, 7"
        "${mainMod} SHIFT, 8, movetoworkspace, 8"
        "${mainMod} SHIFT, 9, movetoworkspace, 9"
        "${mainMod} SHIFT, 0, movetoworkspace, 10"

        "${mainMod},       S, togglespecialworkspace, magic"
        "${mainMod} SHIFT, S, movetoworkspace,        special:magic"

        "${mainMod}, mouse_down, workspace, e+1"
        "${mainMod}, mouse_up,   workspace, e-1"
      ];
      bindel = [
        ",XF86AudioRaiseVolume,  exec, pamixer -i 5"
        ",XF86AudioLowerVolume,  exec, pamixer -d 5"
        ",XF86AudioMute,         exec, pamixer --toggle-mute"
        ",XF86AudioMicMute,      exec, pamixer --default-source --toggle-mute"
        ",XF86MonBrightnessUp,   exec, brightnessctl s 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 5%-"
        ",XF86KbdBrightnessUp,   exec, brightnessctl -d asus::kbd_backlight s 1+"
        ",XF86KbdBrightnessDown, exec, brightnessctl -d asus::kbd_backlight s 1-"
      ];
      bindl = [
        ",switch:on:Lid Switch, exec, hyprctl dispatch exec hyprlock"
        ",XF86AudioPlay,        exec, playerctl play"
        ",XF86AudioStop,        exec, playerctl pause"
        ",XF86AudioNext,        exec, playerctl next"
        ",XF86AudioPrev,        exec, playerctl previous"
      ];
      bindm = [
        "${mainMod}, mouse:272, movewindow"
        "${mainMod}, mouse:273, resizewindow"
      ];

      binds.allow_workspace_cycles = true;
    };
}
