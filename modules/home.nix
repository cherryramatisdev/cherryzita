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
    cmake
    neovim-unwrapped # TODO: Config neovim from nix itself
    lazygit
    gh
    rbenv
    go
    nodejs-18_x
    elixir_1_14
    jq
    fd
  ];
}
