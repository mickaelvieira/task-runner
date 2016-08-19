#!/bin/bash
watch_css() {


    echo "watch css task"

    for entry in ${entries[@]}
    do
        watch_css_entry "${entry}"
    done
}

watch_css_entry() {

    local entry="$1"
    local dir=$(dirname ${entry})
    local bundle="bundle.js"
    local map="bundle.js.map"
    local name=${dir##*/}

    info "Bundle '${name}': ${entry} > ${bundle} ( ${map} )"

    sass --watch style.scss:style.css
    tmux new-window -c "${base_dir}" -n ${name} "watchify ${entry} -v -d -o \"exorcist ${dir}/${map} > ${dir}/${bundle}\""
}
