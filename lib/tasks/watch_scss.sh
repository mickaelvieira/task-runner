
watch_css() {
    local base=
    local name=
    local bundle=

    local entries=($(find "${SRC_DIR}/scss" -name *.scss | grep -vE "_([a-zA-Z-]+)\.scss$"))
    local dest="${DIST_DIR}/css"

    for path_entry in ${entries[@]}; do

        base=$(basename ${path_entry})
        name=${base%.scss}
        bundle="${dest}/${name}.css"

        echo "---"
        info "Bundle: ${name}"
        info "Source: ${path_entry}"
        info "Destination: ${bundle}"

        tmux new-window -c $WORKING_DIR -n ${name} "sass --watch ${path_entry}:${bundle}"
    done
}

check_sass_source_dir
start_tmux
watch_css
