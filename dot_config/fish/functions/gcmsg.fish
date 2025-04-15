function gcmsg --wraps git --description 'alias gcmsg -> git commit --message'
    git commit --message $argv
end
