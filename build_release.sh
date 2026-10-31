#!/usr/bin/bash

cmake -S . -B build_release -DCMAKE_BUILD_TYPE=Release
cmake --build build_release
ln -sfn build_release/compile_commands.json compile_commands.json

