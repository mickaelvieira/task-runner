split_path() {
    local IFS='/'
    local parts=("$1")
    echo $parts
}

get_relative_sut_path() {
    local filepath="$1"
    local relpath=$(dirname ${filepath/$WORKING_DIR/})
    local parts=($(split_path $relpath))

    local sut_rel_path=""
    for part in ${parts[@]}; do
        sut_rel_path+="../"
    done
    sut_rel_path+=${file/${WORKING_DIR}\/}

    echo ${sut_rel_path%.*s}
}

gen_tree() {
    local directories=$(find $SRC_DIR_JS -type d)
    local path=
    for directory in ${directories[@]}; do
        path=${directory/$SRC_DIR_JS/$TEST_DIR}
        if [[ ! -d $path ]]; then
            info "Creating directory: ${path}"
            mkdir -p $path
        fi
    done
}

gen_all_specs() {
    local files=$(find $SRC_DIR_JS -type f -name '*.js' ! -name 'bundle.js' ! -name 'index.js')
    local filepath=
    local relpath=

    for file in ${files[@]}; do
        filepath=${file/$SRC_DIR_JS/$TEST_DIR}
        relpath=$(get_relative_sut_path $filepath)
        if [[ ! -f $filepath ]]; then
            info "Generating spec: ${filepath}"
            touch $filepath
            echo -e "import sinon from 'sinon';" >> $filepath
            echo -e "import should from 'should';" >> $filepath
            echo -e "import sut from '${relpath}';" >> $filepath
        fi
    done
}

gen_one_spec() {
    local file="${WORKING_DIR}/$1"

    if [[ ! -f $file ]]; then
        error "'${file}' does not exist"
    fi

    local filepath=${file/$SRC_DIR_JS/$TEST_DIR}
    local relpath=$(get_relative_sut_path $filepath)

    if [[ ! -f $filepath ]]; then
        info "Generating spec: ${filepath}"
        mkdir -p  $(dirname $filepath)
        touch $filepath
        echo -e "import sinon from 'sinon';" >> $filepath
        echo -e "import should from 'should';" >> $filepath
        echo -e "import sut from '${relpath}';" >> $filepath
    else
        error "'${filepath}' already exist"
    fi
}

genspec() {

    local file=${2:-}

    if [[ ! -z $file ]]; then
        gen_one_spec $file
    else
        read -p "Do you want to generate all the specs? (y/N): " choice

        [[ -z $choice ]] && choice="n"

        if [[ $choice == "y" ]]; then
            gen_tree
            gen_all_specs
        fi
    fi
}



genspec "$@"

