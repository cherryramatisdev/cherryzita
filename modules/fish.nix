{ pkgs, ... }: {
	programs.fish = {
		enable = true;
    shellInit = ''
		set -x PATH $PATH /usr/local/bin/ /opt/homebrew/sbin/ /opt/homebrew/bin/ /Users/cherryramatis/.nix-profile/bin /nix/var/nix/profiles/default/bin/ /Users/cherryramatis/Scripts/
		set -x NVM_DIR $HOME/.nvm
    set fish_greeting # supress fish initial greeting
		fish_vi_key_bindings
    # fish_config theme choose "Rosé Pine Moon"
    set HISTCONTROL ignoreboth # ignore commands with initial space and duplicates
    '';
    shellAliases = {
      "e" = "exit";
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
				name = "nvm";
				src = pkgs.fetchFromGitHub {
					owner = "jorgebucaran";
					repo = "nvm.fish";
					rev = "2.2.11";
					sha256 = "17andma7xsi051wc07wvqimflpyk6m0ghv8y2r41sjyas0n0clj9";
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
