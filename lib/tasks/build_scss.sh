
build_scss() {
    local entries=($(find "${SRC_DIR_SCSS}" -name *.scss | grep -vE "_([a-zA-Z-]+)\.scss$"))

    for path_entry in ${entries[@]}; do

        base=$(basename ${path_entry})
        name=${base%.scss}
        bundle="${DIST_DIR_CSS}/${name}.css"

        echo "---"
        info "Bundle: ${name}"
        info "Source: ${path_entry}"
        info "Destination: ${bundle}"

        sass --trace --no-cache --sourcemap=none "${path_entry}" | uglifycss > ${bundle}
    done
}

if [[ -z $(check_scss_source_dir) ]]; then
    build_scss
else
    echo $(check_scss_source_dir)
fi
