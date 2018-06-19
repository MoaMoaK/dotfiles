#!/bin/sh

get_abs_filename() {
    # $1 : relative filename
    filename=$1
    parentdir=$(dirname "${filename}")

    if [ -d "${filename}" ]; then
        echo "$(cd "${filename}" && pwd)"
    elif [ -d "${parentdir}" ]; then
        echo "$(cd "${parentdir}" && pwd)/$(basename "${filename}")"
    fi
}

CUR_DIR=$(dirname $(get_abs_filename $0))

main() {
    for module in "$@"; do
        echo "Starting setup of $module."

        # Check that there is an install.sh script available
        if [ ! -x "$CUR_DIR/$module/install.sh" ]; then
            echo "$CUR_DIR/$module/install.sh is not an existing executable file. Skipping."
            continue
        fi

        # Run this script
        /bin/sh "$CUR_DIR/$module/install.sh"

        echo "Setup of $module done."
    done;
}

main $@
