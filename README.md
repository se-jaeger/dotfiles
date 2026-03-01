# dotfiles

My personal dot files managed by chezmoi.

## Setup New Machine

On Linux:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

brew install fish

brew install chezmoi
chezmoi init --apply se-jaeger
```

On macOS

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

brew install fish

brew install chezmoi
chezmoi init --apply se-jaeger
```
