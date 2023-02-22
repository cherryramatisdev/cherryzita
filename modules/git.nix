{ pkgs, ... }: {
  programs.git = {
    enable = true;
    extraConfig = {
      color.ui = true;
      user.name = "Cherry Ramatis";
      user.email = "cherry.ramatis@icloud.com";
      pull.rebase = false;
    };
  };
}
