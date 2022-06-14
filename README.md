# dotfiles

My personal dot files managed by chezmoi.


## Setup new machine

On Ubuntu:
(Firstly, add SSH key to GitHub: `ssh-keygen -C "GitHub" -f "~/.ssh/id_rsa" -P ''`)

```bash
sudo sh -c "$(curl -fsLS chezmoi.io/get)" -- -b "/usr/local/bin"
chezmoi init --apply se-jaeger --ssh
```

On macOS

```bash
brew install chezmoi
chezmoi init --apply se-jaeger
```

## My [iTerm2](https://www.iterm2.com) setup

1. **Download and activate `itermcolors`**
    - iTerm2 -> Preferences -> tab "Profiles" -> select <your-profile-name> -> tab "Colors" -> Color Presets... -> Import... -> choose the [`~/.config/custom_starship.itermcolors`](./dot_config/custom_starship.itermcolors) presets
2. **Activate "Natural Text Editing"**
    - iTerm2 -> Preferences -> tab "Profiles" -> select <your-profile-name> -> tab "Keys" -> sub-tab "Key Mappings" -> Presets... -> select "Natural Text Editing"
3. **Increase scroll buffer**
    - iTerm2 -> Preferences -> tab "Profiles" -> select <your-profile-name> -> tab "Terminal" -> tick "Unlimited scrollback"
4. **Working Directory of new sessions**
    - iTerm2 -> Preferences -> tab "Profiles" -> select <your-profile-name> -> tab "General" -> "Working Directory" section -> tick "Reuse precious session's directory"
5. **Execute commands and startup of new sessions**
   1. - iTerm2 -> Preferences -> tab "Profiles" -> select <your-profile-name> -> "Command" section -> Add `activate_py_environment_if_existing && l` to "Send text at start"
6. **Make <your-profile-name> Default**
    - iTerm2 -> Preferences -> tab "Profiles" -> select <your-profile-name> -> Other Actions -> Set as Default
    - *`activate_py_environment_if_existing` is a function from my 
[zsh-activate-py-environment](https://github.com/se-jaeger/zsh-autoactivate-environment)*
