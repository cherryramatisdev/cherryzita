# Dotfiles

My dotfiles configured using [nix](https://nixos.org) [home manager](https://github.com/nix-community/home-manager)

## Usage

1. To install nix on macOS

```sh
sh <(curl -L https://nixos.org/nix/install)
```

2. Clone to correct path

```sh
gh repo clone cherryzita ~/Repos/cherryzita
```

3. Run the flake for the *first time*

```sh
nix build --no-link ~/Repos/cherryzita#homeConfigurations.cherryramatis.activationPackage
```
