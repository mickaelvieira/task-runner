
watch_js() {
    local base=
    local name=
    local bundle=
    local source_map=

    local entries=($(find "${SRC_DIR_JS}" -name index.js))

    for path_entry in ${entries[@]}; do

        base=$(dirname ${path_entry})
        name=${base##*/}
        bundle="${DIST_DIR_JS}/${name}.js"
        source_map="${DIST_DIR_JS}/${name}.js.map"

        echo "---"
        info "Bundle: ${name}"
        info "Source: ${path_entry}"
        info "Destination: ${bundle}"
        info "Source map: ${source_map}"

        tmux new-window -c $WORKING_DIR -n ${name} "watchify ${path_entry} -v -d -o \"exorcist ${source_map} > ${bundle}\""
    done
}

if [[ -z $(check_js_source_dir) ]]; then
    start_tmux
    watch_js
else
    echo $(check_js_source_dir)
fi
