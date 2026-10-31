#!/usr/bin/bash

cmake -S . -B build_debug -DCMAKE_BUILD_TYPE=Debug
cmake --build build_debug
ln -sfn build_debug/compile_commands.json compile_commands.json
