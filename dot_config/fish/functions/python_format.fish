function python_format --argument-names directory

    if test -n "$directory"
        set directory (realpath $directory)
    else
        set directory (pwd)
    end

    set MYPY_CMD "mypy $directory"
    set RUFF_CHECK_CMD "ruff check --fix $directory"
    set RUFF_FORMAT_CMD "ruff format $directory"

    if type -q ruff
        set_color green
        printf "Running: '$RUFF_FORMAT_CMD'\n"
        set_color normal

        eval $RUFF_FORMAT_CMD

        set_color green
        printf "\n\nRunning: '$RUFF_CHECK_CMD'\n"
        set_color normal

        eval $RUFF_CHECK_CMD
    else
        set_color red
        printf "\n\n'ruff' not found"
        set_color normal
    end

    if type -q mypy
        set_color green
        printf "\n\nRunning: '$MYPY_CMD'\n"
        set_color normal

        eval $MYPY_CMD
    else
        set_color red
        printf "\n\n'mypy' not found"
        set_color normal
    end

    true # reset exit code.

end
