autoload -U compinit; compinit

# use completion cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# allow completion menu to be selectable
zstyle ':completion:*' menu select

# complete command options
zstyle ':completion:*' complete-options true

# define completers
zstyle ':completion:*' completer _extensions _complete _approximate

# matche case-insensitive and applies to sub-strings
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# formatting the menu
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'

# Required for completion to be in good groups (named after the tags)
zstyle ':completion:*' group-name ''


# reordering listed groups
zstyle ':completion:*:*:-command-:*:*' group-order aliases commands builtins
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
