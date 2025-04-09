# dotfiles

My personal dot files managed by chezmoi.

## Setup new machine

On Ubuntu:

```bash
sudo sh -c "$(curl -fsLS chezmoi.io/get)" -- -b "/usr/local/bin"
chezmoi init --apply se-jaeger
```

On macOS

```bash
brew install chezmoi
chezmoi init --apply se-jaeger
```
