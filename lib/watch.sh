
watch() {
    start_tmux

    include_lib watch_tests
    include_lib watch_js
    include_lib watch_scss

    tmux ls
    tmux list-windows
    tmux select-window -t "karma"
    tmux attach-session -t "${TMUX_SESSION}"
}

watch
