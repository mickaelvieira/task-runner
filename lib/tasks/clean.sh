#!/bin/bash

clean() {

    # TODO I need to make this value configurable
    local dist_dir="${WORKING_DIR}/dist"

    # let's make we are not remove all the
    [[ ${#dist_dir} < ${#WORKING_DIR} || ${#dist_dir} < 2 ]] && \
        error "Dist directory has not been configured correctly!"

    rm -rf "${dist_dir}/js/*"
    rm -rf "${dist_dir}/css/*"
}

