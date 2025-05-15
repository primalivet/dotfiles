function tn
    set directory_path (find ~/Code -maxdepth 2 -type d | fzf)
    if test $status -ne 0
        return
    end
    
    set directory (basename $directory_path)
    # Redirect stderr to null and handle the pipeline differently in fish
    set existing_session (tmux ls 2>/dev/null | string replace -r ':.*' '' | string match -r $directory)
    
    if test -n "$existing_session"
        if set -q TMUX
            tmux switch-client -t $existing_session
        else
            tmux attach -t $existing_session
        end
    else
        if set -q TMUX
            tmux new -d -s $directory -c $directory_path
            tmux switch-client -t $directory
        else
            tmux new -s $directory -c $directory_path
        end
    end
end
