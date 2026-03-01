if status is-interactive
    ####### Key Bindigns #######
    ############################

    # using vi-bindings
    fish_vi_key_bindings

    for mode in default insert
        bind --mode $mode alt-backspace backward-kill-word

        bind --mode $mode ctrl-f fzf-file-widget
        bind --mode $mode tab fzf_complete

        bind --mode $mode ctrl-j fzf-history-widget execute
        bind --mode $mode ctrl-k fzf-history-widget 'set fish_bind_mode default'

        bind --mode $mode down fzf-history-widget execute
        bind --mode $mode up fzf-history-widget 'set fish_bind_mode default'
    end

    bind --mode default U redo
end
