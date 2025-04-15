function fd --wraps fd --description 'alias fd -> fd --hidden --no-ignore-vcs'
    command fd --hidden --no-ignore-vcs $argv
end
