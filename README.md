<p align="center">
  <img src="https://raw.githubusercontent.com/lilyco-42/webview-mini/main/docs/logo.png" alt="webview-mini" width="200">
</p>

<div align="center">
  <img src="docs/banner.svg" width="720" alt="banner">
</div>

# webview-mini

Minimal C/C++ WebView2 wrapper for Windows - single header, xmake, STL-free.

## 与 `mc-webview-shell` 的关系

两者共用同一个 `webview.h`（单头文件 amalgamation，211 KB），区别只在定位：

- **本仓 `webview-mini`** — 通用起点：库 + xmake / CMake 构建配置 + 最小示例，STL-free。
  要自己起一个新的 WebView2 桌面壳，从这里开始。
- **[`mc-webview-shell`](https://github.com/lilyco-42/mc-webview-shell)** — 场景成品：
  针对 MC 控制台的可直接运行版本，附预编译 exe，并记录了 Clash TUN 导致 WebView2 白屏的绕法。

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
