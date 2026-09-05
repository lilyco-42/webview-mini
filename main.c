// main.c - Minimal WebView2 example
// Build: xmake
#include "webview.h"

#ifdef _WIN32
#include <windows.h>
int WINAPI WinMain(HINSTANCE hInst, HINSTANCE hPrev, LPSTR cmd, int show) {
    (void)hInst; (void)hPrev; (void)cmd; (void)show;
#else
int main(void) {
#endif
    webview_t w = webview_create(0, NULL);
    webview_set_title(w, "Webview Mini");
    webview_set_size(w, 800, 600, WEBVIEW_HINT_NONE);
    webview_navigate(w, "https://example.com");
    webview_run(w);
    webview_destroy(w);
    return 0;
}
