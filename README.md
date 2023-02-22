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

3. Install `home-manager`

```sh
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```

```
nix-shell '<home-manager>' -A install
```

3. Run the home-manaegr

```sh
home-manager switch --flake ~/Repos/cherryzita
```

## To use fish as default shell

Add this line to your `/etc/shells`

```sh
/Users/cherryramatis/.nix-profile/bin/fish
```

Run this

```sh
chsh -s ~/.nix-profile/bin/fish
```

References:
<https://www.bekk.christmas/post/2021/16/dotfiles-with-nix-and-home-manager>
