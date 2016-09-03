
build_js() {

    local base
    local name
    local bundle

    local entries=($(find "${SRC_DIR}/js" -name index.js))
    local dest="${DIST_DIR}/js"

    for path_entry in ${entries[@]}; do

        base=$(dirname ${path_entry})
        name=${base##*/}
        bundle="${dest}/${name}.js"

        echo "---"
        info "Bundle: ${name}"
        info "Source: ${path_entry}"
        info "Destination: ${bundle}"

        browserify -e $path_entry --debug | \
            uglifyjs --compress --mangle --screw-ie8 --output ${bundle}
    done
}

check_js_source_dir
build_js
