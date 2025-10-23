{ config, pkgs, ... }:
{
  home.file."${config.xdg.configHome}/nvim".source = ./config;

  home.sessionVariables = {
    LOMBOK_JAR = "${pkgs.lombok}/share/java/lombok.jar";
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      blink-cmp
      conform-nvim
      gitsigns-nvim
      oil-nvim
      trouble-nvim

      gruber-darker-nvim

      mini-ai
      mini-icons
      mini-notify
      mini-pairs
      mini-surround

      nvim-lspconfig
      nvim-treesitter.withAllGrammars

      typst-preview-nvim

      elixir-tools-nvim
      nvim-jdtls
      nvim-metals

      snacks-nvim
      tmux-nvim
      undotree
    ];

    extraPackages = with pkgs; [
      fd
      ripgrep
      wl-clipboard

      nixfmt-rfc-style
      shfmt
      stylua
      typstyle

      bash-language-server
      clang-tools
      elixir-ls
      gopls
      jdt-language-server
      lua-language-server
      metals
      nil
      tinymist
      typescript-language-server
      verible
      zls
    ];
  };
}
