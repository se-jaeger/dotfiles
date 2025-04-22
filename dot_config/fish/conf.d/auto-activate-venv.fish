if status is-interactive

    # Global flag to track if we're in the middle of handling venv
    set --global __VENV_HANDLING 0

    function __auto_source_venv --on-variable PWD --description "Activate/Deactivate virtualenv on directory change"
        # Prevent running during command substitution or if we're already handling venv
        status --is-command-substitution; and return
        test "$__VENV_HANDLING" -eq 1; and return

        set --global __VENV_HANDLING 1

        # Check if we are inside a git repository
        if command git rev-parse --show-toplevel &>/dev/null
            set dir (realpath (command git rev-parse --show-toplevel))
        else
            set dir (pwd)
        end

        # Find a virtual environment in the directory
        set --local VENV_DIR_NAMES env .env venv .venv
        set --local venv_dir ""
        for name in $VENV_DIR_NAMES
            if test -e "$dir/$name/bin/activate.fish"
                set venv_dir "$dir/$name"
                break
            end
        end

        if test -n "$venv_dir" -a "$VIRTUAL_ENV" != "$venv_dir" -a -e "$venv_dir/bin/activate.fish"
            # prompt is handled by starship
            set --local --export VIRTUAL_ENV_DISABLE_PROMPT 1
            source "$venv_dir/bin/activate.fish"

        else if test -n "$VIRTUAL_ENV" -a -z "$venv_dir"
            deactivate
        end

        set --global __VENV_HANDLING 0
    end

    # Only run initial check if we're not already handling venv
    if test "$__VENV_HANDLING" -eq 0
        __auto_source_venv
    end
end
