#!/bin/bash

watch_js() {
    for entry in ${entries[@]}
    do
        watch_entry "${entry}"
    done
}

watch_entry() {

    local entry="$1"
    local dir=$(dirname ${entry})
    local bundle="bundle.js"
    local map="bundle.js.map"
    local name=${dir##*/}

    info "Bundle '${name}': ${entry} > ${bundle} ( ${map} )"

    tmux new-window -c "${base_dir}" -n ${name} "watchify ${entry} -v -d -o \"exorcist ${dir}/${map} > ${dir}/${bundle}\""
}
