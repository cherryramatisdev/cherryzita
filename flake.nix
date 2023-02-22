{
  description = "My Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs : {
    homeConfigurations = {
      defaultPackage.x86_64-darwin = home-manager.defaultPackage.x86_64-darwin;
      "cherryramatis" = inputs.home-manager.lib.homeManagerConfiguration {
        system = "aarch64-darwin";
        homeDirectory = "/home/cherryramatis";
        username = "cherryramatis";
        configuration.imports = [ ./modules/home.nix ];
      }
    };
  };
}
