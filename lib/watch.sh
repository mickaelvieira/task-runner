
watch() {

    echo "watch task"

    start_tmux
    watch_test
    watch_js
    watch_css

#    tmux ls
#    tmux list-windows
#    tmux attach-session -t "${tmux_session}"
}

watch
