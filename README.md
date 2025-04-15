# dotfiles

My personal dot files managed by chezmoi.

## Setup new machine

On Ubuntu:

```bash
sudo add-apt-repository ppa:fish-shell/release-4
sudo apt update

sudo apt install fish
chsh -s /usr/bin/fish 

sudo sh -c "$(curl -fsLS chezmoi.io/get)" -- -b "/usr/local/bin"
chezmoi init --apply se-jaeger
```

On macOS

```bash
brew install fish
cat /etc/shells | grep fish || echo /usr/local/bin/fish >> /etc/shells
chsh -s /usr/local/bin/fish

brew install chezmoi
chezmoi init --apply se-jaeger
```
