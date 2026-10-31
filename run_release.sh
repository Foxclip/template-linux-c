#!/usr/bin/bash

./build_release.sh
if [ $? -eq 0 ]; then
    echo
    ./build_release/template-linux-c "$@"
fi

