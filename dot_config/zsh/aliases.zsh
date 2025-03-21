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
alias c="clear"
alias o="open"

# Wrapper for yazi that changes directory and alias to make this really fast and robust against typos
function fj() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
        l
	fi
	rm -f -- "$tmp"
}
alias jf="fj"

# nvim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias svim="sudo XDG_CONFIG_HOME=$HOME/.config PATH=$PATH nvim"

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

    eza --all --tree --icons --group-directories-first $LEVEL
}

# git
alias g='git'
alias gaa='git add --all'
alias gc='git commit'
alias gcmsg='git commit --message'
alias gst='git status'
alias gp='git push'

# kubectl
alias k="kubectl"

# fd
alias fd="fd --hidden --no-ignore-vcs"

# watch
alias watch="viddy --differences --bell --skip-empty-diffs"

# gpg-tui
alias gpg-tui="gpg-tui --config '~/.config/gpg-tui/gpg-tui.toml'"
