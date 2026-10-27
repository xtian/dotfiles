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

## Private GitHub flake inputs

The GitHub token used to fetch private flake inputs is stored in
`secrets/nix-access-tokens.age` and included from `/etc/nix/nix.custom.conf`,
so both your user and root (`sudo darwin-rebuild`) can use it.

Use a [fine-grained personal access token](https://github.com/settings/personal-access-tokens/new)
limited to the private repositories with read-only **Contents** access. To
create or rotate it:

```sh
cd secrets
ragenix -i 1password.identity -e nix-access-tokens.age
```

The user key lives in 1Password, so the installed `ragenix` bundles
[`age-plugin-1p`](https://github.com/Enzime/age-plugin-1p).
`1password.identity` tells it to use whichever 1Password SSH key matches the
secret.

The decrypted file should contain a single line:

```
access-tokens = github.com=<token>
```

Commit the updated `.age` file and run `darwin-rebuild switch`.

On a new machine the secret isn't decrypted until the first activation, so
pass the token for that first build:

```sh
sudo nix run nix-darwin/master#darwin-rebuild -- switch \
  --option access-tokens "github.com=<token>"
```
