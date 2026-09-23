-- 注意：用户实际拿到的是 xmake-mirror 里的那份
--   https://github.com/lilyco-42/xmake-mirror/blob/main/packages/w/webview-mini/xmake.lua
-- 本文件与它保持一致。改配方时两处都要改（或只改镜像仓，再把这里同步过去）。
--
-- 旧版本这里写的是 add_versions("1.0.0", "main")：1.0.0 这个 tag 不存在，
-- tarball URL 会 404；而且 on_install 只装头文件不装静态库，
-- 导致 on_test 的 has_cfuncs（编译+链接）必然失败。
package("webview-mini")
    set_homepage("https://github.com/lilyco-42/webview-mini")
    set_description("Minimal WebView2 wrapper - vendored webview/webview, prebuilt MinGW static lib")
    set_license("MIT")

    set_urls("https://github.com/lilyco-42/webview-mini/archive/refs/tags/v$(version).tar.gz",
             "https://github.com/lilyco-42/webview-mini.git")

    add_versions("1.1.0", "e54dc5d394a2dde64b401dd60cc3c9a3faca6c7f8a69847ac351e065360dd8a1")

    add_syslinks("user32", "shell32", "ole32", "oleaut32", "shlwapi", "version", "uuid", "dwmapi")

    on_load(function (package)
        -- C 消费者链 C++ 静态库需要 C++ 运行时 (mingw)
        if package:is_plat("mingw") then
            package:add("links", "webview", "stdc++")
        end
    end)

    -- 仓库目前仅提供 MinGW 预编译静态库; MSVC 用户请用 webview-capi 包
    on_install("mingw", function (package)
        os.cp("webview.h", package:installdir("include"))
        os.cp("lib/libwebview.a", package:installdir("lib"))
    end)

    on_test(function (package)
        assert(package:has_cfuncs("webview_create", {includes = "webview.h"}))
    end)
package_end()
