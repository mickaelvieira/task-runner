#!/bin/bash

watch_test() {
    tmux new-window -c "${base_dir}" -n "karma" "karma start --singleRun=false --autoWatch=true"
}

