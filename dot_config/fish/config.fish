####### Env Variables #######
#############################

# XDG config
set --global --export XDG_CONFIG_HOME "$HOME/.config"
set --global --export XDG_DATA_HOME "$HOME/.local/share"
set --global --export XDG_CACHE_HOME "$HOME/.cache"

# PKM
set --global --export SECOND_BRAIN "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/second-brain"

# default language
set --global --export LANG "en_US.UTF-8"

# set default editor
if type --query hx
    set --global --export EDITOR hx
    set --global --export VISUAL hx
end

# TERM
set --global --export TERM xterm-256color

set --global --export RIPGREP_CONFIG_PATH "$XDG_CONFIG_HOME/ripgrep/config"
set --global --export TEALDEER_CONFIG_DIR "$XDG_CONFIG_HOME/tealdeer"

# use bat for manpages
if type --query bat
    set --global --export MANPAGER "sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
end

# rust 
if test -f "$HOME/.cargo/env.fish"
    . "$HOME/.cargo/env.fish"
end

# fzf
set --global --export FZF_DEFAULT_COMMAND "fd --follow"
set --global --export FZF_DEFAULT_OPTS "
    --height 20
    --preview-window=right,75%
    --preview 'preview {}'
    --layout reverse
    --cycle
    --multi
    --bind 'change:first'
    --bind 'CTRL-j:down'
    --bind 'CTRL-k:up'
    --bind 'CTRL-u:preview-half-page-up'
    --bind 'CTRL-d:preview-half-page-down'
"

####### Interactive Shell Setup #######
#######################################
if status is-interactive
    ####### Fish Setup #######
    ##########################

    # supress greeting message
    set fish_greeting

    # fzf
    fzf --fish | FZF_ALT_C_COMMAND= FZF_CTRL_T_COMMAND= source
    bind --erase ctrl-r

    ####### Key Bindigns #######
    ############################
    # TODO: make more helix like
    # TODO: keybinding for clear-screen in all modes

    # using vi-bindings    
    fish_vi_key_bindings

    for mode in default insert
        bind --mode $mode ctrl-f fzf-file-widget
        bind --mode $mode tab _fzf_search_completions

        bind --mode $mode ctrl-j _fzf_search_history execute
        bind --mode $mode ctrl-k _fzf_search_history 'set fish_bind_mode default'

        bind --mode $mode U redo
    end

    bind --mode insert j,k 'set fish_bind_mode default' repaint-mode

    # move left/right or prev/next directory if commandline is empty
    set -l prevd_or_backward_char '
        if test -z (commandline)
            commandline --function prevd-or-backward-word
        else
            commandline --function backward-char
        end
    '
    set -l nextd_or_forward_char '
        if test -z (commandline)
            commandline --function nextd-or-forward-word
        else
            commandline --function forward-char
        end
    '
    bind --mode insert ctrl-h $prevd_or_backward_char
    bind --mode insert ctrl-l $nextd_or_forward_char

    #### Abbreviations ####
    #######################
    abbr --position command b brew
    abbr --position command c clear
    abbr --position command g git
    abbr --position command k kubectl
    abbr --position command o open

    # Jujutsu
    abbr --position command je jj edit
    abbr --position command jdf jj diff
    abbr --position command jds jj describe
    abbr --position command jl jj log
    abbr --position command jn jj new
    abbr --position command jsh jj show
    abbr --position command jsp jj split
    abbr --position command jsq jj squash
    abbr --position command jst jj status

    #### Setup Tools ####
    #####################

    # set gpg tty to sign git commits
    set --global --export GPG_TTY (tty)
    # add GitHub SSH key to identity for gitui
    ssh-add ~/.ssh/id_ed25519 &>/dev/null

    # zoxide
    if type --query zoxide
        zoxide init fish | source
    end

    # python
    set --global --export POETRY_VIRTUALENVS_IN_PROJECT 1

    #### Prompt ####
    ################
    starship init fish | source
end
