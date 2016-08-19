#!/bin/bash

polyfills() {

    local target="polyfills.min.js"
    local files=()

    cat ${files[@]} | uglifyjs --compress --mangle --screw-ie8 --output "${target}"
}
