cmake_minimum_required(VERSION 3.20)
project(webview-mini C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

add_executable(webview-mini main.c)
set_target_properties(webview-mini PROPERTIES WIN32_EXECUTABLE ON)
target_include_directories(webview-mini PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})

# main.c 是 C：webview.h 在 C 下把 WEBVIEW_API 展开成 extern，只给声明，
# 实现必须另找。仓库里带了预编译的 MinGW-w64 x86_64 静态库，直接链接它 ——
# 既不需要 C++ 工具链，也不需要 WebView2 SDK 头文件。
if(MSVC)
    message(FATAL_ERROR
        "lib/libwebview.a 是 MinGW-w64 (x86_64) 产物，MSVC 无法链接。\n"
        "  · 用 xmake：  xmake\n"
        "  · 或换 MinGW-w64 工具链：  cmake -G Ninja -DCMAKE_C_COMPILER=gcc ..")
endif()

find_library(WEBVIEW_MINI_STATIC
    NAMES webview
    PATHS ${CMAKE_CURRENT_SOURCE_DIR}/lib
    NO_DEFAULT_PATH
    REQUIRED)

target_link_libraries(webview-mini PRIVATE
    ${WEBVIEW_MINI_STATIC}
    stdc++
    user32 shell32 ole32 oleaut32 shlwapi version
)
