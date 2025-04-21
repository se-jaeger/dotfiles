function jj --description 'alias jj -> jj --config-file "$HOME/.config/jj/config.toml"'
    command jj --config-file "$HOME/.config/jj/config.toml" $argv
end
