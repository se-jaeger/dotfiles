# macOS
if test -x /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
end

# Linux
if test -x /home/linuxbrew/.linuxbrew/bin/brew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

set brew_prefix (brew --prefix)
eval ($brew_prefix/bin/brew shellenv)
