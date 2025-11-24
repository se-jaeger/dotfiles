function python_lint --argument-names directory

    if test -n "$directory"
        set directory (realpath $directory)
    else
        set directory (pwd)
    end

    set TY_CMD "ty check $directory"
    set RUFF_CHECK_CMD "ruff check $directory"

    if type -q ruff
        set_color green
        printf "Running: '$RUFF_CHECK_CMD'\n"
        set_color normal

        eval $RUFF_CHECK_CMD
    else
        set_color red
        printf "\n\n'ruff' not found"
        set_color normal
    end

    if type -q ty
        set_color green
        printf "\n\nRunning: '$TY_CMD'\n"
        set_color normal

        eval $TY_CMD
    else
        set_color red
        printf "\n\n'ty' not found"
        set_color normal
    end

    true # reset exit code.

end
