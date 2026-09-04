package("webview-mini")
    set_homepage("https://github.com/lilyco-42/webview-mini")
    set_description("Minimal C/C++ WebView2 wrapper - single header, 200KB exe")
    set_license("MIT")

    add_urls("https://github.com/lilyco-42/webview-mini.git")
    add_versions("1.0.0", "main")  # 用 branch,或具体的 commit hash

    add_syslinks("user32", "shell32", "ole32", "oleaut32", "shlwapi", "version")
    add_includedirs(".")

    on_install(function (package)
        -- 单头文件,直接复制
        os.cp("webview.h", package:installdir("include"))
    end)

    on_test(function (package)
        assert(package:has_cfuncs("webview_create", {includes = "webview.h"}))
    end)
package_end()
