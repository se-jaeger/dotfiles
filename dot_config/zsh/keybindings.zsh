# Use vim key bindings
bindkey -v

# use 'jk' to leave insert mode
bindkey -M viins 'jk' .vi-cmd-mode

# fzf widget that directly runs chosen command
fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept

# use 'CTRL-J' and 'CTRL-k' to search the history
bindkey '^J' fzf-history-widget-accept
bindkey '^K' fzf-history-widget
