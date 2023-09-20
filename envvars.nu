let is_linux: bool = (sys | get host.long_os_version | str downcase | str contains "linux")
let is_wsl: bool = (sys | get host.kernel_version | str downcase | str contains "microsoft")
let is_mac: bool = (sys | get host.long_os_version | str downcase | str contains "macos")

load-env {
    "BAT_THEME": "Dracula",
    "COMPLETION_WAITING_DOTS": "true",
    "DISABLE_UNTRACKED_FILES_DIRTY": "true",
    "EDITOR": "hx",
    "GEM_HOME": $"($env.HOME)/.gem",
    "GLAMOUR_STYLE": "dark",
    "GOPATH": $"($env.HOME)/go",
    "GPG_TTY": (tty),
    "HOMEBREW_NO_ENV_HINTS": "true",
    "LANG": "en_US.UTF-8",
    "LC_CTYPE": "en_US.UTF-8",
    "LIBGL_ALWAYS_INDIRECT": "1",
    "MANPAGER": "most",
    "OCO_EMOJI": "true",
    "OCO_OPENAI_API_KEY": $env.OPENAI_API_KEY,
    "OCO_OPENAI_BASE_PATH": "",
    "OCO_MODEL": "gpt-4"
    "PAGER": "most",
    "RICH_THEME": "dracula",
    "VISUAL": "hx"
}

if ($is_linux) {
    if ($is_wsl) {
        load-env {
            "BROWSER": "wslview",
            "GIT_SSH": "/mnt/c/windows/System32/OpenSSH/ssh.exe"
        }
    }

    load-env {
        "FNM_ARCH":"x64",
        "HOST_IP": (grep nameserver /etc/resolv.conf | awk '{print $2; exit;}'),
        "PYENV_ROOT": $"($env.HOME)/.pyenv",
        "QT_QPA_PLATFORM": "xcb",
        "QT_SCALE_FACTOR": "2",
        "XDG_DATA_DIRS": ([]
            | append /usr/share/ubuntu
            | append /usr/share/gnome
            | append /usr/local/share/
            | append /usr/share/
            | append /var/lib/flatpak/exports/share
            | append $"($env.HOME)/.local/share/flatpak/exports/share")
    }
}

if ($is_mac) {
    load-env {
        "BUN_INSTALL":  "~/.bun",
        "CPPFLAGS": "-I/usr/local/opt/ruby/include",
        "GEM_HOME": $"($env.HOME)/.gem",
        "GOPATH": $"($env.HOME)/go",
        "JAVA_HOME": "/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home",
        "LDLFLAGS": "-F /Library/Frameworks -L/usr/local/opt/ruby/lib",
        "PATH_TO_FX": "/usr/local/etc/javafx/javafx-sdk-11.0.2/lib",
        "PKG_CONFIG_PATH":  ([]
            | append /usr/local/opt/ruby/lib/pkgconfig
            | append /usr/local/opt/xorgproto/share/pkgconfig)
        "RUBY_CONFIGURE_OPTS": "--with-openssl-dir=/opt/homebrew/opt/openssl@1.1",
        "OP_PLUGIN_ALIASES_SOURCED": "1",
        "OPENSSL_CFLAGS": "-Wno-error=implicit-function-declaration"
    }
}
