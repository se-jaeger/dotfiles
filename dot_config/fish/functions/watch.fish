function watch --wraps viddy --description 'alias watch -> viddy --differences --bell --skip-empty-diffs'
    viddy --differences --bell --skip-empty-diffs $argv
end
