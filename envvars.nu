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
    "PAGER": "most",
    "RICH_THEME": "dracula",
    "VISUAL": "hx"
}

let is_linux: bool = (sys | get host.long_os_version | str downcase | str contains "linux")
let is_wsl: bool = (sys | get host.kernel_version | str downcase | str contains "microsoft")

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
        "QT_QPA_PLATFORM": "xcb",
        "QT_SCALE_FACTOR": "2",
        # "SSH_AUTH_SOCK": $"($env.HOME)/.ssh/agent.sock"
    }
} else {
    load-env {
        "CPPFLAGS": "-I/usr/local/opt/ruby/include",
        "GEM_HOME": $"($env.HOME)/.gem",
        "GOPATH": $"($env.HOME)/go",
        "JAVA_HOME": "/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home",
        "LDLFLAGS": "-F /Library/Frameworks -L/usr/local/opt/ruby/lib",
        "PATH_TO_FX": "/usr/local/etc/javafx/javafx-sdk-11.0.2/lib",
        "RUBY_CONFIGURE_OPTS": "--with-openssl-dir=/opt/homebrew/opt/openssl@1.1",
        "OP_PLUGIN_ALIASES_SOURCED": "1",
        "OPENSSL_CFLAGS": "-Wno-error=implicit-function-declaration"
    }
}
