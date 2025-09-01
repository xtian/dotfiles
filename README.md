# dotfiles

## Setting up a new machine

1. [Install Homebrew](https://brew.sh)
2. [Install Determinate Nix](https://docs.determinate.systems/#products)
3. Set up Nix Darwin:

```
sudo mkdir -p /etc/nix-darwin
sudo chown $(id -nu):$(id -ng) /etc/nix-darwin
cd /etc/nix-darwin
git clone https://github.com/xtian/dotfiles.git .
sudo nix run nix-darwin/master#darwin-rebuild -- switch
```
