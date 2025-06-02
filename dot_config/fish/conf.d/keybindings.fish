if status is-interactive
    ####### Key Bindigns #######
    ############################

    # using vi-bindings
    fish_vi_key_bindings

    for mode in default insert
        bind --mode $mode alt-backspace backward-kill-word

        bind --mode $mode ctrl-f fzf-file-widget
        bind --mode $mode tab _fzf_search_completions

        bind --mode $mode ctrl-j _fzf_search_history execute
        bind --mode $mode ctrl-k _fzf_search_history 'set fish_bind_mode default'

        bind --mode $mode up _fzf_search_history
        bind --mode $mode down _fzf_search_history
    end

    bind --mode default U redo
end
