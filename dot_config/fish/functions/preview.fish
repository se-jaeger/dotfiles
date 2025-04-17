function preview --description "Preview file with different tools based on some heuristics"

    # Not file or directory.
    # Just echo it.
    if ! test -d $argv -o -e $argv
        echo $argv

    else
        switch $argv

            case "*.md"
                if command --query glow
                    glow -s $theme $argv
                end

            case "*.plist"
                if command --query plutil
                    plutil -p $argv
                end

            case "*.ipynb"
                if command --query jupyter; and command --query bat
                    jupyter nbconvert --to python --stdout $argv | bat --color always --language python
                end

            case "*"
                set bat_args --color always --style numbers
                set mime (file --brief --mime-type $argv)

                switch $mime[1]
                    case "*/directory"
                        if command --query eza
                            l --color always --no-permissions --no-user
                        end

                    case "text/*"
                        if command --query bat
                            bat $bat_args $argv
                        end

                    case application/json
                        if command --query bat
                            bat $bat_args -l json $argv
                        end

                    case image/{gif,jpeg,png,svg+xml,webp}
                        if command --query timg
                            timg -g (math $COLUMNS - 2)x$LINES --frames 1 $argv
                        end

                    case application/{gzip,java-archive,x-{7z-compressed,bzip2,chrome-extension,rar,tar,xar},zip}
                        if command --query 7z
                            7z l $argv | tail -n +12
                        end

                    case "*"
                        if command --query file
                            set_color yellow
                            echo "Did't find an appropriate tool to preview!"
                            echo
                            set_color normal

                            echo It seems to be: (file --brief $argv)
                            echo "     Mime-Type: $mime"
                        end
                end
        end
    end
end
