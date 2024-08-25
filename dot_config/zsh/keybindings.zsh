# Use vim key bindings
bindkey -v

# use 'jk' to leave insert mode
bindkey -M viins 'jk' vi-cmd-mode

# some custom fzf widgets
fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}

fzf-history-widget-command-mode() {
  fzf-history-widget
  zle vi-cmd-mode
}

zle -N fzf-history-widget-accept
zle -N fzf-history-widget-command-mode

# use 'CTRL-J' and 'CTRL-k' to search the history
bindkey '^J' fzf-history-widget-accept
bindkey '^K' fzf-history-widget-command-mode

# use 'CTRL-H' and 'CTRL-L' to move chars backward/forward
bindkey -M viins '^H' vi-backward-char
bindkey -M viins '^L' vi-forward-char
