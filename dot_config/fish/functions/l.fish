function l --wraps eza --description 'alias ls -> eza --all --long --header --group --git --icons --group-directories-first'
    eza --all --long --header --smart-group --git --icons --group-directories-first $argv
end
