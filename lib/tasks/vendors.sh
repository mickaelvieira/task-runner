#!/bin/bash

vendors() {

    local target="vendor.min.js"
    local files=()

    cat ${files[@]} | \
        uglifyjs --compress --mangle --screw-ie8 --output $target
}

