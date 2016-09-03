
build_js() {
    local base=
    local name=
    local bundle=

    local entries=($(find "${SRC_DIR_JS}" -name index.js))

    for path_entry in ${entries[@]}; do

        base=$(dirname ${path_entry})
        name=${base##*/}
        bundle="${DIST_DIR_JS}/${name}.js"

        echo "---"
        info "Bundle: ${name}"
        info "Source: ${path_entry}"
        info "Destination: ${bundle}"

        browserify -e $path_entry --debug | \
            uglifyjs --compress --mangle --screw-ie8 --output ${bundle}
    done
}

if [[ -z $(check_js_source_dir) ]]; then
    build_js
else
    echo $(check_js_source_dir)
fi
