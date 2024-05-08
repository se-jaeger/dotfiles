# Use vim key bindings
bindkey -v

# use 'jk' to leave insert mode
bindkey -M viins 'jk' .vi-cmd-mode

# setup behavior while selection menu is open
zmodload zsh/complist  # gives access to 'menuselect'
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect '^M' .accept-line
bindkey -M menuselect '^I' accept-and-infer-next-history

# use TAB to go to menu selection
bindkey -M vicmd '^I' down-line-or-select
bindkey -M viins '^I' down-line-or-select

# start in vi command mode
autoload -Uz add-zle-hook-widget
add-zle-hook-widget line-init vi-cmd-mode

# fzf widget that directly runs choosen command
fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept

# use 'j' to search and run command and 'k' to be able adjust it
bindkey -M vicmd 'j' fzf-history-widget-accept
bindkey -M vicmd 'k' fzf-history-widget
