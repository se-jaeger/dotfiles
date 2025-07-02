# dotfiles

My personal dot files managed by chezmoi.

## Setup new machine

On Linux:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install fish
cat /etc/shells | grep fish || echo /home/linuxbrew/.linuxbrew/bin/fish | sudo tee --append /etc/shells
chsh -s /home/linuxbrew/.linuxbrew/bin/fish

brew install chezmoi
chezmoi init --apply se-jaeger
```

On macOS

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install fish
cat /etc/shells | grep fish || echo /usr/local/bin/fish >> /etc/shells
chsh -s /usr/local/bin/fish

brew install chezmoi
chezmoi init --apply se-jaeger
```
