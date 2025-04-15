function ls_on_changed_PWD --on-variable PWD --description "List Directory when PWD changed"
    # Prevent running during command substitution
    status --is-command-substitution; and return
    l
end
