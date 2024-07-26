function switch_tmux_session
    set session (find ~ ~/Documents/personal ~/Documents/CNGROUP ~/Documents/projects -mindepth 1 -maxdepth 1 -type d | fzf)
    set session_name (basename "$session" | tr . _)

    if not tmux has-session -t "$session_name" ^/dev/null
        tmux new-session -s "$session_name" -c "$session" -d
    end

    tmux switch-client -t "$session_name"
end
