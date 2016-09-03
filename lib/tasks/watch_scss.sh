
watch_css() {
    local base=
    local name=
    local bundle=

    local entries=($(find "${SRC_DIR_SCSS}" -name *.scss | grep -vE "_([a-zA-Z-]+)\.scss$"))

    for path_entry in ${entries[@]}; do

        base=$(basename ${path_entry})
        name=${base%.scss}
        bundle="${DIST_DIR_JS}/${name}.css"

        echo "---"
        info "Bundle: ${name}"
        info "Source: ${path_entry}"
        info "Destination: ${bundle}"

        tmux new-window -c $WORKING_DIR -n ${name} "sass --watch ${path_entry}:${bundle}"
    done
}

if [[ -z $(check_scss_source_dir) ]]; then
    start_tmux
    watch_css
else
    echo $(check_scss_source_dir)
fi
