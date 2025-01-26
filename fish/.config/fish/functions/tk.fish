function tk
    # In fish, we need to handle the pipeline differently
    tmux ls | string replace -r ':.*' '' | string split ' ' | string match -r $argv[1] | xargs -I{} tmux kill-session -t {}
end

