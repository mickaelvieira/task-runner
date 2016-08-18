#!/bin/bash

build_js() {
    for entry in ${entries[@]}
    do
        build_entry "${entry}"
    done
}

build_entry() {

    local entry="$1"
    local dir=$(dirname ${entry})
    local bundle="${dir}/bundle.js"
    local name=${dir##*/}

    info "Bundle '${name}': ${entry} > ${bundle}"

    browserify -e ${entry} --debug | uglifyjs --compress --mangle --screw-ie8 --output "${bundle}"
}



