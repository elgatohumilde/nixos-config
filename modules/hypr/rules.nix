{ ... }:
{
  wayland.windowManager.hyprland.settings.windowrulev2 =
    let
      dialogTitles = [
        "Open File"
        "Select a File"
        "Choose wallpaper"
        "Open Folder"
        "Save As"
        "Library"
        "File Upload"
      ];
      dialogRules = map (title: [ "float, title:^(${title})(.*)$" ]) dialogTitles;
    in
    [
      "suppressevent maximize, class:.*"

      "float,class:^(F_window)$"
      "float,class:^(imv)$"

      "float, class:org\\.pulseaudio\\.pavucontrol"
      "size 75% 75%, class:org\\.pulseaudio\\.pavucontrol"

      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      "suppressevent maximize, class:.*"
    ]
    ++ builtins.concatLists dialogRules;
}
