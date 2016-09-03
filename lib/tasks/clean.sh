
clean() {

    # let's make we are not remove all the
    [[ ${#DIST_DIR} < ${#WORKING_DIR} || ${#DIST_DIR} < 2 ]] && \
        error "Dist directory has not been configured correctly!"

    rm -rvf ${DIST_DIR}/js/*
    rm -rvf ${DIST_DIR}/css/*
}

clean
