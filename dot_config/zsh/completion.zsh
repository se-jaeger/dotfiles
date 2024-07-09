autoload -U compinit; compinit

# use completion cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# complete command options
zstyle ':completion:*' complete-options true

# define completers
zstyle ':completion:*' completer _extensions _complete _approximate

# matche case-insensitive and applies to sub-strings
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# allow completion menu to be selectable
zstyle ':completion:*' menu select

# Required for completion to be in good groups (named after the tags)
zstyle ':completion:*' group-name ''

# reordering listed groups
zstyle ':completion:*:*:-command-:*:*' group-order aliases commands builtins
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories

## FZF-tab settings
zstyle ':fzf-tab:*' continuous-trigger 'tab'
zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
zstyle ':fzf-tab:*' accept-line enter
zstyle ':fzf-tab:*' switch-group '<' '>'

## Previews
# command: tldr
zstyle ':fzf-tab:complete:tldr:argument-1' fzf-preview \
    'tldr --color always $word'

# command: man
zstyle ':fzf-tab:complete:(\\|*/|)man:' fzf-preview \
    '[[ $group == "manual page" ]] && MANPAGER="" man $word | bat --color always --language man'
