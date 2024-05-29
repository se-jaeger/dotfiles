#### Builtin replacements ####
##############################

alias ls="eza --all --long --header --group --git --icons --group-directories-first"
alias cat="bat"

cd() {
    builtin cd "$@"
    ls
}

#### For Convenience ####
#########################
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias l="ls"

# nvim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

# move to already visited directories
m() {
    z "$@"
    ls
}

# custom tree command
tree(){
    if [ -n "$1" ]; then
        LEVEL="--level=$1"
    else
        LEVEL=""
    fi

    eza --all --tree --header --group --git --icons --group-directories-first $LEVEL
}

# git
alias g='git'
alias gaa='git add --all'
alias gcmsg='git commit --message'
alias gst='git status'
alias gp='git push'

# kubectl
alias k="kubectl"

