package("webview-mini")
    set_homepage("https://github.com/lilyco-42/webview-mini")
    set_description("Minimal C/C++ WebView2 wrapper - single header, 200KB exe. Windows 23KB Android-style WebView.")
    set_license("MIT")

    set_urls("https://github.com/lilyco-42/webview-mini/archive/refs/tags/$(version).tar.gz",
             "https://github.com/lilyco-42/webview-mini.git")

    add_versions("1.0.0", "main")

    add_syslinks("user32", "shell32", "ole32", "oleaut32", "shlwapi", "version")
    add_includedirs(".")

    on_install(function (package)
        -- Single header library, just copy the header
        os.cp("webview.h", package:installdir("include"))
    end)

    on_test(function (package)
        assert(package:has_cfuncs("webview_create", {includes = "webview.h"}))
    end)
package_end()
