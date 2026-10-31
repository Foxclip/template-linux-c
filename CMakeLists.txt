cmake_minimum_required(VERSION 3.10)
project(template-linux-c C)

# Включаем автоматическую генерацию compile_commands.json
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(template-linux-c
    main.c
)

