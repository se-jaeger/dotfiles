if status is-interactive
    ####### Key Bindigns #######
    ############################

    # using vi-bindings    
    fish_vi_key_bindings

    for mode in default insert
        bind --mode $mode ctrl-f fzf-file-widget
        bind --mode $mode tab _fzf_search_completions

        bind --mode $mode ctrl-j _fzf_search_history execute
        bind --mode $mode ctrl-k _fzf_search_history 'set fish_bind_mode default'
    end

    bind --mode default U redo

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
    abbr --position command k kubectl
    abbr --position command o open
    abbr --position command c clear
    abbr --position command jf fj
    abbr --position command cat bat

    # Jujutsu
    abbr --position command je jj edit
    abbr --position command jdf jj diff
    abbr --position command jds jj describe
    abbr --position command jl jj log
    abbr --position command jn jj new
    abbr --position command jsh jj show
    abbr --position command jsp jj split -i
    abbr --position command jsq jj squash
    abbr --position command jst jj status
end
