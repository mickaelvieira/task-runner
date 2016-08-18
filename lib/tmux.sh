#!/bin/bash

declare -r tmux_session="tasks-runner"

is_server_up() {
    tmux info &> /dev/null
}

has_session() {
    tmux has-session -t "${tmux_session}" &> /dev/null
}

start_tmux() {

    is_server_up && has_session

    if [[ $? -eq 1  ]]
    then
        tmux new-session -s "${tmux_session}" -d
    fi
}

stop_tmux() {

    has_session

    if [[ $? -ne 1 ]]
    then
        tmux kill-session -t "${tmux_session}"
    fi
}

