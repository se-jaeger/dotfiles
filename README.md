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

## My [iTerm2](https://www.iterm2.com) setup

1. **Download and activate `itermcolors`**
    - iTerm2 -> Preferences -> tab "Profiles" -> select <your-profile-name> -> tab "Colors" -> Color Presets... -> Import... -> choose the [`~/.config/custom_starship.itermcolors`](./dot_config/custom_starship.itermcolors) presets
2. **Activate "Natural Text Editing"**
    - iTerm2 -> Preferences -> tab "Profiles" -> select <your-profile-name> -> tab "Keys" -> sub-tab "Key Mappings" -> Presets... -> select "Natural Text Editing"
3. **Increase scroll buffer**
    - iTerm2 -> Preferences -> tab "Profiles" -> select <your-profile-name> -> tab "Terminal" -> tick "Unlimited scrollback"
4. **Working Directory of new sessions**
    - iTerm2 -> Preferences -> tab "Profiles" -> select <your-profile-name> -> tab "General" -> "Working Directory" section -> tick "Reuse previous session's directory"
5. **Execute commands and startup of new sessions**
   - iTerm2 -> Preferences -> tab "Profiles" -> select <your-profile-name> -> tab "General" -> "Command" section -> Add `activate_py_environment_if_existing && l` to "Send text at start"
6. **Setup closing behavior**
    - iTerm2 -> Preferences -> tab "Profiles" -> select <your-profile-name> -> "Session" section -> "'Undo' can revive ..." -> set to `600` seconds
    - iTerm2 -> Preferences -> tab "Profiles" -> select <your-profile-name> -> "Session" section -> "Prompt before closing?" -> tick "If there are jobs besides:"
7. **Remap `⌥+Return↩` shortcut (for `broot`)**
   - iTerm2 -> Preferences -> tab "Profiles" -> select <your-profile-name> -> tab "Keys" -> sub-tab "Key Mappings" -> add new mapping `+`
   - Chose "Action:" `Send Hex Codes: 0x1b 0x0d`
8. **Allow Python API**
   - iterm2 -> General -> tab "Magic" -> tick "Enable Python API"
9.  **Make <your-profile-name> Default**
    - iTerm2 -> Preferences -> tab "Profiles" -> select <your-profile-name> -> Other Actions -> Set as Default
  
**Remarks:**  
- `activate_py_environment_if_existing` is a function from my 
[zsh-activate-py-environment](https://github.com/se-jaeger/zsh-autoactivate-environment)
- `l` is a alias of zsh and adjusted in [.zshrc](./dot_zshrc.tmpl).
