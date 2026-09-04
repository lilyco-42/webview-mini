# webview-mini

Minimal C/C++ WebView2 wrapper for Windows - single header, xmake, STL-free.

## Quick Start

### xmake (recommended)
```bash
xmake
```

### CMake
```bash
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
cmake --build .
```

## Usage

```c
#include "webview.h"

int main(void) {
    webview_t w = webview_create(0, NULL);
    webview_set_title(w, "My App");
    webview_set_size(w, 800, 600, WEBVIEW_HINT_NONE);
    webview_navigate(w, "https://example.com");
    webview_run(w);
    webview_destroy(w);
    return 0;
}
```

## Files

| File | Description |
|------|-------------|
| `webview.h` | Single header (211 KB) |
| `main.c` | Minimal example |
| `xmake.lua` | xmake config |
| `CMakeLists.txt` | CMake config |

## Requirements

- Windows 10+
- WebView2 Runtime (included in Win10+)
- MSVC or MinGW

## License

MIT
