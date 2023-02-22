{ pkgs, ... }: {
  home.stateVersion = "22.11";
  home.username = "cherryramatis";
  home.homeDirectory = "/Users/cherryramatis";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    bat
    curl
    fzf
    ripgrep
  ];
}
