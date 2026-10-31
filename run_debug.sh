#!/usr/bin/bash

./build_debug.sh
if [ $? -eq 0 ]; then
    echo
    ./build_debug/@@@PROJECT_NAME@@@ "$@"
fi

