# Use vim key bindings
bindkey -v

# use 'jk' to leave command mode
bindkey -M viins 'jk' vi-cmd-mode

# setup behavior while selection menu is open
zmodload zsh/complist  # gives access to 'menuselect'
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'u' undo
bindkey -M menuselect '^M' accept-line
bindkey -M menuselect '^I' accept-and-infer-next-history

bindkey -M vicmd 'k' fzf-history-widget
bindkey -M vicmd 'j' expand-or-complete
bindkey -M vicmd '^I' expand-or-complete

