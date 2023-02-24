{ pkgs, ... }:
let
  base = ''
      set -x PATH $PATH /usr/local/bin/ /opt/homebrew/sbin/ /opt/homebrew/bin/ /Users/cherryramatis/.nix-profile/bin /nix/var/nix/profiles/default/bin/ /Users/cherryramatis/Scripts/ 
      set -x PATH /Users/cherryramatis/.rbenv/shims $PATH
      set -x PATH /Users/cherryramatis/.npm-global/bin $PATH
      set -x PATH /Users/cherryramatis/.cargo/bin $PATH
      set -x NODE_OPTIONS --openssl-legacy-provider
      set -x NVM_DIR $HOME/.nvm /Users/cherryramatis/Library/pnpm
      set -x FZF_DEFAULT_COMMAND "rg --files --hidden --follow --glob '!.git'"
      set -x EDITOR hx
      set -x VISUAL hx
      set -x GIT_EDITOR hx
      set fish_greeting # supress fish initial greeting
      fish_vi_key_bindings
      # fish_config theme choose "Rosé Pine Moon"
      set HISTCONTROL ignoreboth # ignore commands with initial space and duplicates
      set -gx RBENV_SHELL fish
      command rbenv rehash 2>/dev/null

      fish_add_path /opt/homebrew/opt/postgresql@13/bin

      set -gx LDFLAGS "-L/opt/homebrew/opt/postgresql@13/lib"
      set -gx CPPFLAGS "-I/opt/homebrew/opt/postgresql@13/include"
      set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/postgresql@13/lib/pkgconfig"
  '';

  functions = ''
    function rbenv
      set command $argv[1]
      set -e argv[1]

      command rbenv "$command" $argv
    end
  '';
in
{
  programs.fish = {
    enable = true;
    shellInit = (base + functions);
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
