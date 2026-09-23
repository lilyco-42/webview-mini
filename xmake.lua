add_rules("mode.debug", "mode.release")

target("webview-mini")
    set_kind("binary")
    add_files("main.c")
    add_includedirs(".")
    -- main.c 是 C：webview.h 在 C 下只给声明（WEBVIEW_API 展开成 extern），
    -- 实现来自仓库里的预编译静态库。不链上就会报
    --   undefined reference to `webview_create'
    -- stdc++ 是因为静态库里有 C++ 代码，少了会报 operator new 未定义。
    add_linkdirs("lib")
    add_links("webview", "stdc++")
    add_syslinks("user32", "shell32", "ole32", "oleaut32", "shlwapi", "version")
    set_languages("c11")
    if is_plat("mingw") then
        -- main.c 用的是 WinMain；-mwindows 让它成为 GUI 程序（否则会多弹一个控制台窗口）。
        -- force 是必须的：xmake 会探测标志是否「有用」，探测不过就静默丢掉。
        add_ldflags("-mwindows", {force = true})
    end
    if is_mode("release") then
        set_optimize("smallest")
    end
target_end()
