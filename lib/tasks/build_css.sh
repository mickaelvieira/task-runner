
build_css() {

    local entries=($(find "${SRC_DIR_CSS}" -name *.css | grep -vE "min\.css$"))

    for path_entry in ${entries[@]}; do

        name=$(basename ${path_entry})
        bundle="${DIST_DIR_CSS}/${name}"

        echo "---"
        info "Bundle: ${name}"
        info "Source: ${path_entry}"
        info "Destination: ${bundle}"

        uglifycss --ugly-comments ${path_entry} > ${bundle}
    done
}

if [[ -z $(check_css_source_dir) ]]; then
    build_css
else
    echo $(check_css_source_dir)
fi
