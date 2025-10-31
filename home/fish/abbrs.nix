{ ... }:
{

  programs.fish.shellAbbrs = {
    cls = "clear";
    ls = "eza";
    tree = "eza -T";
    open = "xdg-open";
    nv = "nvim";
    nvs = "nvim -S";
    lg = "lazygit";
    ldc = "lazydocker";
  };

}
