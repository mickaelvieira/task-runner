
build_css() {

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

        sass --trace --no-cache --sourcemap=none "${path_entry}" | uglifycss > ${bundle}
    done
}

build_css

