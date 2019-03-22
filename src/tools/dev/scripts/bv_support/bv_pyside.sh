function bv_pyside_initialize
{
    if [[ "$DO_STATIC_BUILD" == "no" ]]; then
        export DO_PYSIDE="yes"
    else
        export DO_PYSIDE="no"
    fi
}

function bv_pyside_enable
{
    DO_PYSIDE="yes"
    DO_QT="yes"
}

function bv_pyside_disable
{
    DO_PYSIDE="no"
}

function bv_pyside_depends_on
{
    echo "clang cmake python qt"
}

function bv_pyside_initialize_vars
{
    info "initialize PySide vars"
}

function bv_pyside_info
{
    # should match qt version
    export PYSIDE_VERSION=${PYSIDE_VERSION:-"5.12.2"}
    export PYSIDE_FILE=${PYSIDE_FILE:-"pyside-setup-${PYSIDE_VERSION}.tar.gz"}
    export PYSIDE_SOURCE_DIR=${PYSIDE_SOURCE_DIR:-"pyside-setup-${PYSIDE_VERSION}"}
    export PYSIDE_BUILD_DIR=${PYSIDE_BUILD_DIR:-"pyside-setup-${PYSIDE_VERSION}-build"}
    export PYSIDE_MD5_CHECKSUM=""
    export PYSIDE_SHA256_CHECKSUM=""
}

function bv_pyside_print
{
    printf "%s%s\n" "PYSIDE_FILE=" "${PYSIDE_FILE}"
    printf "%s%s\n" "PYSIDE_VERSION=" "${PYSIDE_VERSION}"
    printf "%s%s\n" "PYSIDE_PLATFORM=" "${PYSIDE_PLATFORM}"
    printf "%s%s\n" "PYSIDE_BUILD_DIR=" "${PYSIDE_BUILD_DIR}"
}

function bv_pyside_print_usage
{
    printf "%-20s %s [%s]\n" "--pyside" "Build PySide" "$DO_PYSIDE"
}

function bv_pyside_host_profile
{
    if [[ "$DO_PYSIDE" == "yes" ]] ; then
        echo >> $HOSTCONF
        echo "##" >> $HOSTCONF
        echo "## PySide" >> $HOSTCONF
        echo "##" >> $HOSTCONF
        echo "SETUP_APP_VERSION(PYSIDE $PYSIDE_VERSION)" >> $HOSTCONF
        echo "VISIT_OPTION_DEFAULT(VISIT_PYSIDE_DIR \${VISITHOME}/pyside/\${PYSIDE_VERSION}/\${VISITARCH}/)" >> $HOSTCONF
    fi
}

function bv_pyside_ensure
{
    if [[ "$DO_PYSIDE" = "yes" && "$DO_SERVER_COMPONENTS_ONLY" == "no" ]] ; then
        ensure_built_or_ready "pyside"     $PYSIDE_VERSION    $PYSIDE_BUILD_DIR    $PYSIDE_FILE 
        if [[ $? != 0 ]] ; then
            ANY_ERRORS="yes"
            DO_PYSIDE="no"
            error "Unable to build PySide.  ${PYSIDE_FILE} not found."
        fi
    fi
}

function bv_pyside_dry_run
{
    if [[ "$DO_PYSIDE" == "yes" ]] ; then
        echo "Dry run option not set for pyside."
    fi
}

function apply_pyside_5122_patch
{
  info "Patching pyside 5.12.2"
  patch -p0 << \EOF
 diff -c sources/pyside2/PySide2/QtQml/CMakeLists.txt.orig sources/pyside2/PySide2/QtQml/CMakeLists.txt
*** sources/pyside2/PySide2/QtQml/CMakeLists.txt.orig   2019-02-26 15:27:58.303596033 -0800
--- sources/pyside2/PySide2/QtQml/CMakeLists.txt        2019-02-26 15:28:05.316595289 -0800
***************
*** 11,17 ****
  ${QtQml_GEN_DIR}/qqmlcomponent_wrapper.cpp
  ${QtQml_GEN_DIR}/qqmlcontext_wrapper.cpp
  ${QtQml_GEN_DIR}/qqmlerror_wrapper.cpp
! ${QtQml_GEN_DIR}/qqmldebuggingenabler_wrapper.cpp
  ${QtQml_GEN_DIR}/qqmlengine_wrapper.cpp
  ${QtQml_GEN_DIR}/qqmlexpression_wrapper.cpp
  ${QtQml_GEN_DIR}/qqmlextensioninterface_wrapper.cpp
--- 11,17 ----
  ${QtQml_GEN_DIR}/qqmlcomponent_wrapper.cpp
  ${QtQml_GEN_DIR}/qqmlcontext_wrapper.cpp
  ${QtQml_GEN_DIR}/qqmlerror_wrapper.cpp
! #${QtQml_GEN_DIR}/qqmldebuggingenabler_wrapper.cpp
  ${QtQml_GEN_DIR}/qqmlengine_wrapper.cpp
  ${QtQml_GEN_DIR}/qqmlexpression_wrapper.cpp
  ${QtQml_GEN_DIR}/qqmlextensioninterface_wrapper.cpp

EOF
    if [[ $? != 0 ]] ; then
        warn "pyside 5.12.2 patch failed."
        return 1
    fi

    return 0;
}

function apply_pyside_patch
{
    if [[ ${PYSIDE_VERSION} == 5.12.2 ]] ; then
        apply_pyside_5122_patch
        if [[ $? != 0 ]] ; then
            return 1
        fi
    fi
 
    return 0
}

# *************************************************************************** #
#                          Function 4.2, build_pyside                          #
# *************************************************************************** #

function build_pyside
{
   # Extract the sources
    if [[ -d $PYSIDE_SOURCE_DIR ]] ; then
        if [[ ! -f $PYSIDE_FILE ]] ; then
            warn "The PySide directory exists, deleting before uncompressing"
            rm -Rf $PYSIDE_SOURCE_DIR
            ensure_built_or_ready $PYSIDE_INSTALL_DIR    $PYSIDE_VERSION    $PYSIDE_SOURCE_DIR    $PYSIDE_FILE
        fi
    fi

    #
    # Prepare the build dir using src file.
    #
    prepare_build_dir $PYSIDE_SOURCE_DIR $PYSIDE_FILE
    untarred_pyside=$?
    # 0, already exists, 1 untarred src, 2 error

    if [[ $untarred_pyside == -1 ]] ; then
        warn "Unable to prepare PySide source directory. Giving Up!"
        return 1
    fi

    #
    # Apply patches
    #
    info "Patching PySide . . . "
    cd $PYSIDE_SOURCE_DIR || error "Can't cd to PySide source dir."
    apply_pyside_patch
    if [[ $? != 0 ]] ; then
        if [[ $untarred_pyside == 1 ]] ; then
            warn "Giving up on pyside build because the patch failed."
            return 1
        else
            warn "Patch failed, but continuing. I believe that this script\n" \
                 "tried to apply a patch to an existing directory that had\n" \
                 "already been patched ... that is, the patch is\n" \
                 "failing harmlessly on a second application."
        fi
    fi

    cd $START_DIR
    if [[ ! -d $PYSIDE_BUILD_DIR ]] ; then
        echo "Making build directory $PYSIDE_BUILD_DIR"
        mkdir $PYSIDE_BUILD_DIR
    fi

    #rm -Rf ${PYSIDE_BUILD_DIR}/CMakeCache.txt ${PYSIDE_BUILD_DIR}/*/CMakeCache.txt


    VISIT_PYSIDE_DIR="${VISITDIR}/pyside/${PYSIDE_VERSION}/${VISITARCH}/"

    export CLANG_INSTALL_DIR=${VISIT_LLVM_DIR}
    export PATH=${QT_BIN_DIR}:$PATH
    #export PATH=$VISIT_PYSIDE_DIR/bin:$VISIT_PYTHON_DIR/bin:$PATH
    export PATH=$VISIT_PYTHON_DIR/bin:$PATH
    export PYTHONPATH=$VISIT_PYSIDE_DIR/lib/python${PYTHON_COMPATIBILITY_VERSION}/site-packages:$PYTHONPATH
    export PKG_CONFIG_PATH=$VISIT_PYSIDE_DIR/lib/pkgconfig:$PKG_CONFIG_PATH

    ALTERNATIVE_QT_INCLUDE_DIR="$QT_INCLUDE_DIR"
    
    # There is a bug on mac that using system qt
    # where headers say they are in /usr/include
    # when in reality most of the headers are in
    # /Library/Frameworks (except for QtUiTools)
    if [[ "Darwin" == `uname` && 
                "$QT_LIB_DIR" == "/Library/Frameworks" &&
                "$QT_INCLUDE_DIR" == "/usr/include" ]]; then
        ALTERNATIVE_QT_INCLUDE_DIR="$QT_LIB_DIR"
    fi

    #
    # Make sure to pass compilers and compiler flags to cmake
    #
    popts=""
    popts="${popts} -DCMAKE_C_COMPILER:STRING=${C_COMPILER}"
    popts="${popts} -DCMAKE_CXX_COMPILER:STRING=${CXX_COMPILER}"
    popts="${popts} -DCMAKE_C_FLAGS:STRING=\"${C_OPT_FLAGS}\""
    popts="${popts} -DCMAKE_CXX_FLAGS:STRING=\"${CXX_OPT_FLAGS}\""
    popts="${popts} -DCMAKE_INSTALL_PREFIX:FILEPATH=\"$VISIT_PYSIDE_DIR\""
    popts="${popts} -DCMAKE_SKIP_BUILD_RPATH:BOOL=false"
    popts="${popts} -DCMAKE_BUILD_WITH_INSTALL_RPATH:BOOL=false"
    popts="${popts} -DCMAKE_INSTALL_RPATH:FILEPATH=\"$VISIT_PYSIDE_DIR/lib\""
    popts="${popts} -DCMAKE_INSTALL_RPATH_USE_LINK_PATH:BOOL=true"
    popts="${popts} -DCMAKE_INSTALL_NAME_DIR:FILEPATH=\"$VISIT_PYSIDE_DIR/lib\""
    popts="${popts} -DCMAKE_BUILD_TYPE:STRING=\"${VISIT_BUILD_MODE}\""
    popts="${popts} -DALTERNATIVE_QT_INCLUDE_DIR:FILEPATH=\"$ALTERNATIVE_QT_INCLUDE_DIR\""
    popts="${popts} -DQT_QMAKE_EXECUTABLE:FILEPATH=\"$QT_QMAKE_COMMAND\""
    popts="${popts} -DBUILD_TESTS:BOOL=false"
    popts="${popts} -DENABLE_ICECC:BOOL=false"
    popts="${popts} -DENABLE_VERSION_SUFFIX:BOOL=false"
    popts="${popts} -DPYTHON_EXECUTABLE:FILEPATH=\"$PYTHON_COMMAND\""
    popts="${popts} -DPYTHON_INCLUDE_PATH:FILEPATH=\"$PYTHON_INCLUDE_DIR\""
    popts="${popts} -DPYTHON_LIBRARY:FILEPATH=\"$PYTHON_LIBRARY\""
    popts="${popts} -DDISABLE_DOCSTRINGS:BOOL=true"
    popts="${popts} -DCMAKE_PREFIX_PATH=${QT_INSTALL_DIR}/lib/cmake"

    if [[ "$DO_MESAGL" == "yes" ]] ; then
        popts="${popts} -DGL_H=${MESAGL_INCLUDE_DIR}/GL/gl.h"
    fi
    info "Configuring pyside . . ."
    CMAKE_BIN="${CMAKE_INSTALL}/cmake"

    info "pyside build dir ${PYSIDE_BUILD_DIR}"
    cd $PYSIDE_BUILD_DIR || error "Can't cd to PySide build dir."

    if test -e bv_run_cmake.sh ; then
        rm -f bv_run_cmake.sh
    fi
    echo "\"${CMAKE_BIN}\"" ${popts} ../${PYSIDE_SOURCE_DIR} > bv_run_cmake.sh
    cat bv_run_cmake.sh
    issue_command bash bv_run_cmake.sh || error "pyside configuration failed."

    info "Building pyside . . ."
    $MAKE $MAKE_OPT_FLAGS || \
        error "PySide did not build correctly. Giving up."

    info "Installing pyside . . ."
    $MAKE install || error "PySide did not install correctly."

    if [[ "$DO_GROUP" == "yes" ]] ; then
        chmod -R ug+w,a+rX "$VISITDIR/pyside"
        chgrp -R ${GROUP} "$VISITDIR/pyside"
    fi

    cd "$START_DIR"

    info "Done with PySide"

    return 0
}

function bv_pyside_is_enabled
{
    if [[ "$DO_SERVER_COMPONENTS_ONLY" == "yes" ]]; then
        return 0;
    fi 
    if [[ $DO_PYSIDE == "yes" ]]; then
        return 1    
    fi
    return 0
}

function bv_pyside_is_installed
{
    VISIT_PYSIDE_DIR="${VISITDIR}/pyside/${PYSIDE_VERSION}/${VISITARCH}/"
    check_if_installed "pyside" $PYSIDE_VERSION
    if [[ $? != 0 ]] ; then
        return 0
    fi
    return 1
}

function bv_pyside_build
{
    #
    # Build PySide
    #
    cd "$START_DIR"
    if [[ "$DO_PYSIDE" == "yes" && "$DO_SERVER_COMPONENTS_ONLY" == "no" ]] ; then
        bv_pyside_is_installed #this returns 1 for true, 0 for false
        if [[ $? != 0 ]] ; then
            info "Skipping PySide build.  PySide is already installed."
        else
            info "Building PySide (~10 minutes)"
            build_pyside
            if [[ $? != 0 ]] ; then
                error "Unable to build or install PySide.  Bailing out."
            fi
            info "Done building PySide"
        fi
    fi
}
