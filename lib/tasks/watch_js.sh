
watch_js() {

    local entries=($(find "${SRC_DIR}/js" -name index.js))
    local dest="${DIST_DIR}/js"

    for path_entry in ${entries[@]}; do

        local base=$(dirname ${path_entry})
        local name=${base##*/}
        local bundle="${dest}/${name}.js"
        local source_map="${dest}/${name}.js.map"

        echo "---"
        info "Bundle: ${name}"
        info "Source: ${path_entry}"
        info "Destination: ${bundle}"
        info "Source map: ${source_map}"

        tmux new-window -c $WORKING_DIR -n ${name} "watchify ${path_entry} -v -d -o \"exorcist ${source_map} > ${bundle}\""
    done
}

watch_js
