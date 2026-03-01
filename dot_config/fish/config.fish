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

# fzf
set --global --export FZF_DEFAULT_COMMAND "fd --follow"
set --global --export FZF_DEFAULT_OPTS "
    --height 20
    --preview-window 'right,50%,wrap'
    --layout reverse
    --cycle
    --multi
    --marker '*'
    --bind 'change:first'
    --bind 'CTRL-j:down'
    --bind 'CTRL-k:up'
    --bind 'CTRL-u:preview-half-page-up'
    --bind 'CTRL-d:preview-half-page-down'
    --with-shell 'fish -c'
"
# python
set --global --export POETRY_VIRTUALENVS_IN_PROJECT 1

####### Interactive Shell Setup #######
#######################################
if status is-interactive

    # supress greeting message
    set fish_greeting

    #### Setup Tools ####
    #####################

    # zellij
    if type --query zellij
        eval (zellij setup --generate-auto-start fish | string collect)
    end

    # television
    if type --query tv
        tv init fish | source
    end

    # fzf
    if type --query fzf
        fzf --fish | FZF_ALT_C_COMMAND= FZF_CTRL_T_COMMAND= FZF_CTRL_R_COMMAND= source
    end

    # zoxide
    if type --query zoxide
        zoxide init fish | source
    end

    #### Prompt ####
    ################
    if type --query starship
        function starship_transient_prompt_func
            set_color brblack
            printf '\n----> '
            set_color normal
        end
        starship init fish | source
        enable_transience
    end
end
