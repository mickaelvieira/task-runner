
clean() {
    # let's make we are not remove all the
    [[ ${#DIST_DIR_JS} < ${#WORKING_DIR} || ${#DIST_DIR_CSS} < ${#WORKING_DIR} || \
        ${#DIST_DIR_JS} < 2 || ${#DIST_DIR_CSS} < 2 ]] && \
        error "Dist directory has not been configured correctly!"

    rm -rvf ${DIST_DIR_JS}/*
    rm -rvf ${DIST_DIR_CSS}/*
}

clean
