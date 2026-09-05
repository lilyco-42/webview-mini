// webview.cpp - WebView2 静态库编译单元 (webview/webview 融合头)
// 构建静态库: g++ -c webview.cpp -DWEBVIEW_STATIC -O2 -std=c++17 -I<WebView2 SDK include> 
// 预编译产物见 lib/libwebview.a (MinGW-w64 x64); C 消费者链接时需加 -lstdc++
#include "webview.h"
