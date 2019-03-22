function bv_clang_initialize
{
    export DO_CLANG="no"
}

function bv_clang_enable
{
    DO_CLANG="yes"
}

function bv_clang_disable
{
    DO_CLANG="no"
}

function bv_clang_depends_on
{
    depends_on="cmake python llvm"
    echo ${depends_on}
}

function bv_clang_info
{
    info "function bv_clang info, llvm version is ${BV_LLVM_VERSION}"
    #clang version should be the same as LLVM
    export BV_CLANG_VERSION=${BV_CLANG_VERSION:-"6.0.1"}
    export BV_CLANG_FILE=${BV_CLANG_FILE:-"cfe-${BV_CLANG_VERSION}.src.tar.xz"}
    export BV_CLANG_BUILD_DIR=${BV_CLANG_BUILD_DIR:-"cfe-${BV_CLANG_VERSION}.src"}
    export BV_CLANG_URL=${BV_CLANG_URL:-"http://releases.llvm.org/${BV_CLANG_VERSION}/"}
    export CLANG_MD5_CHECKSUM=""
    export CLANG_SHA256_CHECKSUM=""
}

function bv_clang_print
{
    printf "%s%s\n" "BV_CLANG_FILE=" "${BV_CLANG_FILE}"
    printf "%s%s\n" "BV_CLANG_VERSION=" "${BV_CLANG_VERSION}"
    printf "%s%s\n" "CLANG_TARGET=" "${CLANG_TARGET}"
    printf "%s%s\n" "BV_CLANG_BUILD_DIR=" "${BV_CLANG_BUILD_DIR}"
}

function bv_clang_print_usage
{
    printf "%-20s %s [%s]\n" "--clang" "Build CLANG" "$DO_CLANG"
}

function bv_clang_host_profile
{
    if [[ "$DO_CLANG" == "yes" ]] ; then
        echo >> $HOSTCONF
        echo "##" >> $HOSTCONF
        echo "## CLANG" >> $HOSTCONF
        echo "##" >> $HOSTCONF
        echo "VISIT_OPTION_DEFAULT(VISIT_CLANG_DIR \${VISITHOME}/clang/$BV_CLANG_VERSION/\${VISITARCH})" >> $HOSTCONF
    fi
}

function bv_clang_initialize_vars
{
    export VISIT_CLANG_DIR=${VISIT_CLANG_DIR:-"$VISITDIR/clang/${BV_CLANG_VERSION}/${VISITARCH}"}
    CLANG_INCLUDE_DIR="${VISIT_CLANG_DIR}/include"
    CLANG_LIB_DIR="${VISIT_CLANG_DIR}/lib"
    if [[ "$DO_STATIC_BUILD" == "yes" ]]; then
        CLANG_LIB="${CLANG_LIB_DIR}/libCLANG.a"
    else
        CLANG_LIB="${CLANG_LIB_DIR}/libCLANG.${SO_EXT}"
    fi
}

function bv_clang_selected
{
    args=$@
    if [[ $args == "--clang" ]]; then
        DO_CLANG="yes"
        return 1
    fi

    return 0
}

function bv_clang_ensure
{
    if [[ "$DO_DBIO_ONLY" != "yes" ]]; then
        if [[ "$DO_CLANG" == "yes" ]] ; then
            ensure_built_or_ready "clang"   $BV_CLANG_VERSION   $BV_CLANG_BUILD_DIR   $BV_CLANG_FILE $BV_CLANG_URL
            if [[ $? != 0 ]] ; then
                return 1
            fi
        fi
    fi
}

function bv_clang_dry_run
{
    if [[ "$DO_CLANG" == "yes" ]] ; then
        echo "Dry run option not set for clang."
    fi
}


function build_clang
{
    #
    # prepare build dir
    #
    prepare_build_dir $BV_CLANG_BUILD_DIR $BV_CLANG_FILE
    untarred_clang=$?
    if [[ $untarred_clang == -1 ]] ; then
        warn "Unable to prepare CLANG build directory. Giving Up!"
        return 1
    fi

    #
    # Build CLANG.
    #

    #
    # CLANG must be built with an out of source build.
    #
    BV_CLANG_SRC_DIR=${BV_CLANG_BUILD_DIR}
    BV_CLANG_BUILD_DIR="${BV_CLANG_SRC_DIR}-build"
    if [[ ! -d ${BV_CLANG_BUILD_DIR} ]] ; then
        info "Making build directory ${BV_CLANG_BUILD_DIR}"
        mkdir ${BV_CLANG_BUILD_DIR}
    fi

    cd ${BV_CLANG_BUILD_DIR} || error "Couldn't cd to clang build dir."

    #
    # Remove any CMakeCache.txt files just to be safe.
    #
    rm -f CMakeCache.txt */CMakeCache.txt

    info "Configuring CLANG . . ."
    info " to be installed at ${VISIT_LLVM_DIR}"
    ${CMAKE_COMMAND} \
        -DCMAKE_INSTALL_PREFIX:PATH="${VISIT_LLVM_DIR}" \
        -DCMAKE_BUILD_TYPE:STRING="${VISIT_BUILD_MODE}" \
        -DCMAKE_BUILD_WITH_INSTALL_RPATH:BOOL=ON \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} ${CXX_OPT_FLAGS}" \
        -DCMAKE_CXX_COMPILER:STRING=${CXX_COMPILER} \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS} ${C_OPT_FLAGS}" \
        -DCMAKE_C_COMPILER:STRING=${C_COMPILER} \
        -DLLVM_CONFIG:FILEPATH=${VISIT_LLVM_DIR}/bin/llvm-config \
        -DPYTHON_EXECUTABLE:FILEPATH=$PYTHON_COMMAND \
        ../${BV_CLANG_SRC_DIR}
    if [[ $? != 0 ]] ; then
        warn "CLANG cmake failed.  Giving up"
        return 1
    fi

    info "Building CLANG . . ."
    ${MAKE} ${MAKE_OPT_FLAGS}
    if [[ $? != 0 ]] ; then
        warn "CLANG build failed.  Giving up"
        return 1
    fi

    info "Installing CLANG . . ."
    ${MAKE} ${MAKE_OPT_FLAGS} install
    if [[ $? != 0 ]] ; then
        warn "CLANG install failed.  Giving up"
        return 1
    fi

    if [[ "$DO_GROUP" == "yes" ]] ; then
        chmod -R ug+w,a+rX "$VISITDIR/clang"
        chgrp -R ${GROUP} "$VISITDIR/clang"
    fi
    cd "$START_DIR"
    info "Done with CLANG"
    return 0
}

function bv_clang_is_enabled
{
    if [[ $DO_CLANG == "yes" ]]; then
        return 1    
    fi
    return 0
}

function bv_clang_is_installed
{
    if [[ -d ${VISIT_LLVM_DIR}/lib/cmake/clang ]] ; then
        return 1
    else
        return 0
    fi
}

function bv_clang_build
{
    #
    # Build CLANG
    #
    cd "$START_DIR"
    if [[ "$DO_CLANG" == "yes" ]] ; then
        check_if_installed "clang" $BV_CLANG_VERSION
        if [[ $? == 0 ]] ; then
            info "Skipping CLANG build.  CLANG is already installed."
        else
            info "Building CLANG (~60 minutes)"
            build_clang
            if [[ $? != 0 ]] ; then
                error "Unable to build or install CLANG.  Bailing out."
            fi
            info "Done building CLANG"
        fi
    fi
}
