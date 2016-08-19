
clean() {

    # let's make we are not remove all the
    [[ ${#DIST_DIR} < ${#WORKING_DIR} || ${#DIST_DIR} < 2 ]] && \
        error "Dist directory has not been configured correctly!"

    rm -rf "${DIST_DIR}/js/*"
    rm -rf "${DIST_DIR}/css/*"
}

clean
