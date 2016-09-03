
watch_tests() {
    tmux new-window -c $WORKING_DIR -n "karma" "karma start --singleRun=false --autoWatch=true"
}

start_tmux
watch_tests
