cmake_minimum_required(VERSION 3.10)
project(@@@PROJECT_NAME@@@ C)

# Включаем автоматическую генерацию compile_commands.json
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(@@@PROJECT_NAME@@@
    main.c
)

