{ ... }:
{

  programs.fish.shellAbbrs = {
    cls = "clear";
    ls = "eza";
    ll = "eza -lF";
    la = "eza -lAF";
    tree = "eza -T";
    open = "xdg-open";
    nv = "nvim";
    nvs = "nvim -S";
    lg = "lazygit";
    ldc = "lazydocker";
  };

}
