function c
    set directory (find ~/Code -maxdepth 2 -type d | fzf)
    # fish uses $status instead of $?
    if test $status -ne 0
        return
    end
    if test -n "$directory"
        cd $directory
    end
end

