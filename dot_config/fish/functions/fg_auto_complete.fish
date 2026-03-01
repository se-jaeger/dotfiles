function fg_auto_complete --description 'Convenience fg that tab-completes if multiple jobs exist'
    set --local njobs (jobs | count)
    if test $njobs -gt 0
        if test $njobs -eq 1
            fg

        else if test $njobs -gt 1
            commandline --insert "fg "
            fzf_complete
            commandline --function execute
        end

        commandline --function repaint
    end
end
