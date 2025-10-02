# dotfiles

## Setting up a new machine

1. [Install Homebrew](https://brew.sh)
2. [Install Determinate Nix](https://docs.determinate.systems/#products)
3. Set hostname to `xtian-mbp`
4. Enable Full Disk Access for Terminal in System Settings > Privacy & Security
5. Set up Nix Darwin:

```
sudo mkdir -p /etc/nix-darwin
sudo chown $(id -nu):$(id -ng) /etc/nix-darwin
cd /etc/nix-darwin
git clone https://github.com/xtian/dotfiles.git .
sudo nix run nix-darwin/master#darwin-rebuild -- switch
```

5. Enable iCloud Desktop & Documents sync
6. Set Alfred preferences folder to ~/Documents
