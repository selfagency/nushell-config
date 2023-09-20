# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# $env.PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
if (sys | get host.long_os_version | str downcase | str contains "linux") {
    $env.PYENV_ROOT = $"($env.HOME)/.pyenv"

    $env.PATH = ($env.PATH
        | append /usr/local/bin
        | append /usr/local/sbin
        | append $"($env.HOME)/go/bin"
        | append $"($env.HOME)/.cargo/bin"
        | append $"($env.HOME)/.local/bin"
        | append $"($env.HOME)/bin"
        | append /home/linuxbrew/.linuxbrew/bin
        | append /home/linuxbrew/.linuxbrew/sbin
    )

    $env.XDG_DATA_DIRS = ([]
        | append /usr/share/ubuntu
        | append /usr/share/gnome
        | append /usr/local/share/
        | append /usr/share/
        | append /var/lib/flatpak/exports/share
        | append /home/dsieradski/.local/share/flatpak/exports/share
    )
} else {
    $env.PATH = (
        | append ~/.bun/bin
        | append ~/.cargo/bin
        | append ~/.local/bin
        | append ~/bin
        | append ~/go/bin
        | append /opt/homebrew/bin
        | append /opt/homebrew/opt/rabbitmq/sbin
        | append /Applications
        | append /opt/homebrew/opt/ruby/bin
        | append /usr/local/bin
        | append /usr/local/sbin
        | append /usr/sbin
        | append ($env.PATH | split row (char esep))
    )

    $env.BUN_INSTALL = "~/.bun"
    $env.PKG_CONFIG_PATH = []
        | append /usr/local/opt/ruby/lib/pkgconfig
        | append /usr/local/opt/xorgproto/share/pkgconfig
}

