#!/bin/bash

declare -r TMUX_SESSION="tasks-runner"

is_server_up() {
    tmux info &> /dev/null
}

has_session() {
    tmux has-session -t $TMUX_SESSION &> /dev/null
}

start_tmux() {

    is_server_up && has_session

    [[ $? -eq 1  ]] && tmux new-session -s $TMUX_SESSION -d
}

stop_tmux() {

    has_session

    [[ $? -ne 1 ]] && tmux kill-session -t $TMUX_SESSION
}

