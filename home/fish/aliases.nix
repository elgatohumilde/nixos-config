{ ... }:
{

  programs.fish.shellAliases = {
    sudo = "sudo ";
    cls = "clear";
    ls = "eza";
    tree = "ls -T";
    open = "xdg-open";
    nv = "nvim";
    nvs = "nvim -S";
    lg = "lazygit";
    ldc = "lazydocker";
  };

}
