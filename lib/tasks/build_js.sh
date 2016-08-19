
build_js() {

    local entries=($(find "${SRC_DIR}/js" -name index.js))
    local dest="${DIST_DIR}/js"

    for path_entry in ${entries[@]}; do

        local base=$(dirname ${path_entry})
        local name=${base##*/}
        local bundle="${dest}/${name}.js"

        echo "---"
        info "Bundle: ${name}"
        info "Source: ${path_entry}"
        info "Destination: ${bundle}"

        browserify -e $path_entry --debug | \
            uglifyjs --compress --mangle --screw-ie8 --output ${bundle}
    done
}

build_js
