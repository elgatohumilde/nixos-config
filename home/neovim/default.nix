{ pkgs, ... }:
{

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;
    clipboard.register = "unnamedplus";

    colorscheme = "gruber-darker";

    globals = {
      mapleader = " ";
      maplocalleader = ",";

      have_nerd_font = true;
    };

    opts = {
      autoindent = true;
      background = "dark";
      breakindent = true;
      cursorline = true;
      encoding = "UTF-8";
      expandtab = true;
      ignorecase = true;
      number = true;
      relativenumber = true;
      scrolloff = 20;
      shiftwidth = 2;
      showmode = false;
      smartcase = true;
      smartindent = true;
      smarttab = true;
      splitbelow = true;
      splitright = true;
      swapfile = false;
      tabstop = 2;
      termguicolors = true;
      undofile = true;
      virtualedit = "all";
      winblend = 0;
      winborder = "rounded";
      wrap = false;
    };

    autoCmd = [
      {
        event = [ "TextYankPost" ];
        callback.__raw = "function() vim.highlight.on_yank() end";
      }
    ];

    diagnostic.settings = {
      virtual_text = true;
    };

    plugins = {
      oil = {
        enable = true;

        settings = {
          view_options.show_hidden = true;
        };
      };
      mini = {
        enable = true;
        mockDevIcons = true;

        modules = {
          ai = { };
          icons = { };
          pairs = { };
          surround = { };
        };
      };
      blink-cmp = {
        enable = true;

        settings = {
          signature.enabled = true;
          completion = {
            documentation.auto_show = true;
          };
        };
      };
      conform-nvim = {
        enable = true;
        autoInstall.enable = true;

        settings = {
          format_on_save.lsp_format = "fallback";

          formatters_by_ft = {
            cpp = [ "clang-format" ];
            elixir = [ "mix" ];
            nix = [ "nixfmt" ];
            sh = [ "shfmt" ];
            typst = [ "typstyle" ];
          };
        };
      };
      treesitter = {
        enable = true;

        settings = {
          highlight.enable = true;
        };
      };
      snacks = {
        enable = true;

        settings = {
          notifier.enabled = true;
        };
      };
      typst-preview = {
        enable = true;

        settings = {
          invert_colors = "auto";
          dependencies_bin = {
            tinymist = "tinymist";
            websocat = "websocat";
          };
        };
      };
      haskell-tools = {
        enable = true;
      };
      undotree = {
        enable = true;
      };
      lspconfig = {
        enable = true;
      };
      fidget = {
        enable = true;
      };
      gitsigns = {
        enable = true;
      };
    };

    lsp = {
      keymaps = [
        {
          mode = [ "n" ];
          key = "<leader>d";
          action.__raw = "vim.diagnostic.open_float";
        }
        {
          mode = [ "n" ];
          key = "<leader>so";
          action.__raw = "Snacks.picker.lsp_symbols";
        }
        {
          mode = [ "n" ];
          key = "gD";
          action.__raw = "Snacks.picker.lsp_declarations";
        }
        {
          mode = [ "n" ];
          key = "gd";
          action.__raw = "Snacks.picker.lsp_definitions";
        }
        {
          mode = [ "n" ];
          key = "gi";
          action.__raw = "Snacks.picker.lsp_implementations";
        }
        {
          mode = [ "n" ];
          key = "gr";
          action.__raw = "Snacks.picker.lsp_references";
        }
        {
          mode = [ "n" ];
          key = "gt";
          action.__raw = "Snacks.picker.lsp_type_definitions";
        }
        {
          mode = [ "n" ];
          key = "<leader>ca";
          lspBufAction = "code_action";
        }
        {
          mode = [ "n" ];
          key = "<leader>rn";
          lspBufAction = "rename";
        }
        {
          mode = [ "n" ];
          key = "K";
          lspBufAction = "hover";
        }
      ];

      servers = {
        bashls.enable = true;
        clangd.enable = true;
        gopls.enable = true;
        nil_ls.enable = true;
        tinymist.enable = true;
        ts_ls.enable = true;
        zls.enable = true;

        verible = {
          enable = true;
          config.cmd = [
            "verible-verilog-ls"
            "--rules_config_search"
          ];
        };
      };
    };

    keymaps = [
      {
        mode = [
          "n"
          "v"
        ];
        key = "gL";
        action = "g$";
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "gh";
        action = "^";
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "gl";
        action = "$";
      }
      {
        mode = [ "n" ];
        key = "<leader>/";
        action = "/";
      }
      {
        mode = [ "n" ];
        key = "<A-z>";
        action = ":b#<CR>";
      }
      {
        mode = [ "n" ];
        key = "<Esc>";
        action = ":nohl<CR>";
      }
      {
        mode = [ "n" ];
        key = "<leader>-";
        action = "<cmd>sp<CR>";
      }
      {
        mode = [ "n" ];
        key = "<leader>|";
        action = ":vs<CR>";
      }
      {
        mode = [ "n" ];
        key = "U";
        action = "<C-r>";
      }
      {
        mode = [ "n" ];
        key = "q:";
        action = "<nop>";
      }
      {
        mode = [ "o" ];
        key = "ie";
        action = ":<C-u>normal! mzggVG<CR>`z";
      }
      {
        mode = [ "t" ];
        key = "<Esc><Esc>";
        action = "<C-\\><C-n>";
      }
      {
        mode = [ "v" ];
        key = "<leader>r";
        action = "\"hy:%s/<C-r>h//g<left><left>";
      }
      {
        mode = [ "x" ];
        key = "<leader>p";
        action = "\"_dP";
      }
      {
        mode = [ "x" ];
        key = "ie";
        action = ":<C-u>normal! ggVG<CR>";
      }

      {
        mode = [ "n" ];
        key = "<leader>n";
        action = ":e ~/.dotfiles/home/neovim<CR>";
      }

      {
        mode = [ "n" ];
        key = "<C-s>";
        action = ":Oil<CR>";
      }
      {
        mode = [ "n" ];
        key = "<leader>tp";
        action = ":TypstPreviewToggle<CR>";
      }
      {
        mode = [ "n" ];
        key = "<leader>ut";
        action = ":UndotreeToggle<CR>";
      }
      {
        mode = [ "n" ];
        key = "/";
        action.__raw = "Snacks.picker.lines";
      }
      {
        mode = [ "n" ];
        key = "<F1>";
        action.__raw = "Snacks.picker.help";
      }
      {
        mode = [ "n" ];
        key = "<leader><leader>";
        action.__raw = "Snacks.picker.buffers";
      }
      {
        mode = [ "n" ];
        key = "<leader>Q";
        action.__raw = "Snacks.bufdelete.other";
      }
      {
        mode = [ "n" ];
        key = "<leader>q";
        action.__raw = "Snacks.bufdelete.delete";
      }
      {
        mode = [ "n" ];
        key = "<leader>sd";
        action.__raw = "Snacks.picker.diagnostics";
      }
      {
        mode = [ "n" ];
        key = "<leader>sf";
        action.__raw = "Snacks.picker.files";
      }
      {
        mode = [ "n" ];
        key = "<leader>sg";
        action.__raw = "Snacks.picker.grep";
      }
    ];

    extraConfigLua = ''
      require("elixir").setup({
        elixirls = {
          cmd = { "elixir-ls" },
        },
      })
      require("tmux").setup()
      vim.ui.select = Snacks.picker.select
    '';

    extraPlugins = with pkgs.vimPlugins; [
      elixir-tools-nvim
      gruber-darker-nvim
      tmux-nvim
    ];

    extraPackages = with pkgs; [
      haskellPackages.cabal-gild
      elixir-ls
    ];
  };

}
