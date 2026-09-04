cmake_minimum_required(VERSION 3.20)
project(webview-mini C)

set(CMAKE_C_STANDARD 11)

add_executable(webview-mini main.c)
target_include_directories(webview-mini PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(webview-mini PRIVATE
    user32 shell32 ole32 oleaut32 shlwapi version
)
