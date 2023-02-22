{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    shellInit = ''
      set -x PATH $PATH /usr/local/bin/ /opt/homebrew/sbin/ /opt/homebrew/bin/ /Users/cherryramatis/.nix-profile/bin /nix/var/nix/profiles/default/bin/ /Users/cherryramatis/Scripts/ /opt/homebrew/opt/postgresql@15/bin
      set -x NVM_DIR $HOME/.nvm /Users/cherryramatis/Library/pnpm ~/.npm-global/bin
      set -x FZF_DEFAULT_COMMAND "rg --files --hidden --follow --glob '!.git'"
      set -x EDITOR nvim
      set -x VISUAL nvim
      set -x GIT_EDITOR nvim
      set fish_greeting # supress fish initial greeting
      fish_vi_key_bindings
      # fish_config theme choose "Rosé Pine Moon"
      set HISTCONTROL ignoreboth # ignore commands with initial space and duplicates
    '';
    shellAliases = {
      "e" = "exit";
      "c" = "clear";
      "sync" = "stow . -t ~/";
      "chmox" = "chmod +x";
      "lg" = "lazygit";
      "vi" = "$EDITOR";
      "v" = "vim";
      "gp" = "~/Scripts/gp";
      "gup" = "~/Scripts/gup";
      "cat" = "bat";
      "b" = "bundle";
      "be" = "bundle exec";
      "ba" = "bundle add";
      "depupdate" = "yarn upgrade-interactive --latest";
      "gst" = "git status";
      "ga" = "git add";
      "gc" = "git commit --verbose";
    };
    plugins = [
      {
        name = "hydro";
        src = pkgs.fishPlugins.hydro.src;
      }
      {
        name = "forgit";
        src = pkgs.fishPlugins.forgit.src;
      }
      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "z";
          rev = "HEAD";
          sha256 = "+FUBM7CodtZrYKqU542fQD+ZDGrd2438trKM0tIESs0=";
        };
      }
      {
        name = "omni";
        src = pkgs.fetchFromGitHub {
          owner = "getomni";
          repo = "fish";
          rev = "v1.0.0";
          sha256 = "wEwYrIED3vootteL/x8SQqtkUMSFPrv+il7VWf/O39s=";
        };
      }
      {
        name = "fzf.fish";
        src = pkgs.fetchFromGitHub {
          owner = "PatrickF1";
          repo = "fzf.fish";
          rev = "v8.1";
          sha256 = "uqYVbRdrcO6StaIim9S8xmb9P67CmXnLEywSeILn4yQ=";
        };
      }
    ];
  };
}
