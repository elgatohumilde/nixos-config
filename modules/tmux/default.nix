{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;

    prefix = "M-x";
    baseIndex = 1;
    escapeTime = 0;
    mouse = true;
    terminal = "tmux-256color";

    extraConfig = ''
      ### opts
      set -g renumber-windows on

      setw -g mode-keys vi
      set -g default-shell "${pkgs.fish}/bin/fish"
      set -as terminal-features '*:RGB:hyperlinks:clipboard'


      ### style
      set -g status-position top
      set -g status-left-length 100
      set -g status-justify absolute-centre

      set -g window-status-style 'fg=brightblack'
      set -g window-status-current-style 'fg=yellow bg=default bold'

      set -g status-right-length 100
      set -g status-left-style 'fg=brightblack'
      set -g status-style 'fg=white bg=default'

      set -g status-left ' [#S] '
      set -g status-right '  #(git -C "#{pane_current_path}" rev-parse --abbrev-ref HEAD) '


      ### binds
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      bind -n M-H previous-window
      bind -n M-L next-window

      bind g display-popup -E -w 90% -h 90% -d '#{pane_current_path}' lazygit

      is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?\.?(view|n?vim?x?)(-wrapped)?(diff)?$'"

      bind -n 'C-h' if-shell "$is_vim" 'send-keys C-h' { if -F '#{pane_at_left}' "" 'select-pane -L' }
      bind -n 'C-j' if-shell "$is_vim" 'send-keys C-j' { if -F '#{pane_at_bottom}' "" 'select-pane -D' }
      bind -n 'C-k' if-shell "$is_vim" 'send-keys C-k' { if -F '#{pane_at_top}' "" 'select-pane -U' }
      bind -n 'C-l' if-shell "$is_vim" 'send-keys C-l' { if -F '#{pane_at_right}' "" 'select-pane -R' }

      bind -T copy-mode-vi 'C-h' if -F '#{pane_at_left}' "" 'select-pane -L'
      bind -T copy-mode-vi 'C-j' if -F '#{pane_at_bottom}' "" 'select-pane -D'
      bind -T copy-mode-vi 'C-k' if -F '#{pane_at_top}' "" 'select-pane -U'
      bind -T copy-mode-vi 'C-l' if -F '#{pane_at_right}' "" 'select-pane -R'

      is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

      bind -n 'M-h' if-shell "$is_vim" 'send-keys M-h' 'resize-pane -L 1'
      bind -n 'M-j' if-shell "$is_vim" 'send-keys M-j' 'resize-pane -D 1'
      bind -n 'M-k' if-shell "$is_vim" 'send-keys M-k' 'resize-pane -U 1'
      bind -n 'M-l' if-shell "$is_vim" 'send-keys M-l' 'resize-pane -R 1'

      bind -T copy-mode-vi M-h resize-pane -L 1
      bind -T copy-mode-vi M-j resize-pane -D 1
      bind -T copy-mode-vi M-k resize-pane -U 1
      bind -T copy-mode-vi M-l resize-pane -R 1

      bind -n 'C-M-h' if-shell "$is_vim" 'send-keys C-M-h' 'swap-pane -s "{left-of}"'
      bind -n 'C-M-j' if-shell "$is_vim" 'send-keys C-M-j' 'swap-pane -s "{down-of}"'
      bind -n 'C-M-k' if-shell "$is_vim" 'send-keys C-M-k' 'swap-pane -s "{up-of}"'
      bind -n 'C-M-l' if-shell "$is_vim" 'send-keys C-M-l' 'swap-pane -s "{right-of}"'

      bind -T copy-mode-vi C-M-h swap-pane -s "{left-of}"
      bind -T copy-mode-vi C-M-j swap-pane -s "{down-of}"
      bind -T copy-mode-vi C-M-k swap-pane -s "{up-of}"
      bind -T copy-mode-vi C-M-l swap-pane -s "{right-of}"

    '';
  };
}
