# macOS
if test -x /usr/local/bin/brew
    eval (/usr/local/bin/brew shellenv)
end

# Linux
if test -x /home/linuxbrew/.linuxbrew/bin/brew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

set brew_prefix (brew --prefix)
eval ($brew_prefix/bin/brew shellenv)
