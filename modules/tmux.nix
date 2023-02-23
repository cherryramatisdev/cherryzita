{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    shortcut = "a"; # Prefix for tmux <C-a>
    baseIndex = 1;
    newSession = true;
    escapeTime = 1;
    historyLimit = 999999999;
    aggressiveResize = false;

    plugins = with pkgs; [
      tmuxPlugins.tmux-thumbs
      tmuxPlugins.tmux-fzf
    ];

    extraConfig = ''
      # https://old.reddit.com/r/tmux/comments/mesrci/tmux_2_doesnt_seem_to_use_256_colors/
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"
      set-window-option -g mode-keys vi
      # Mouse works as expected
      set-option -g mouse on

      bind r source-file ~/.tmux.conf \; display "~/.tmux.conf Reloaded!"
      bind C-r source-file ~/.tmux.conf \; display "~/.tmux.conf Reloaded!"

      # Use unprefixed meta keys to split panes
      bind -n M-'\' split-window -h -c '#{pane_current_path}'
      bind -n M-- split-window -v -c '#{pane_current_path}'

      # Use unprefixed Alt-vim keys to switch panes
      bind -n M-h select-pane -L
      bind -n M-j select-pane -D
      bind -n M-k select-pane -U
      bind -n M-l select-pane -R

      # Capital versions to resize
      bind -n M-C-h resize-pane -L 5
      bind -n M-C-j resize-pane -D 5
      bind -n M-C-k resize-pane -U 5
      bind -n M-C-l resize-pane -R 5
      '';
  };
}
