function tree --wraps eza --argument-names level
    if test -n "$level"
        set level "--level=$level"
    else
        set level "--level=2"
    end

    eza --all --tree --icons --group-directories-first $level
end
