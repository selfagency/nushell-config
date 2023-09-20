# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# $env.PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
let is_linux: bool = (sys | get host.long_os_version | str downcase | str contains "linux")
let is_mac: bool = (sys | get host.long_os_version | str downcase | str contains "macos")

if ($is_linux) {
    $env.PATH = ($env.PATH
        | append /usr/local/bin
        | append /usr/local/sbin
        | append $"($env.HOME)/go/bin"
        | append $"($env.HOME)/.cargo/bin"
        | append $"($env.HOME)/.local/bin"
        | append $"($env.HOME)/bin"
        | append /home/linuxbrew/.linuxbrew/bin
        | append /home/linuxbrew/.linuxbrew/sbin
        | append ($env.PATH | split row (char esep))
    )
}

if ($is_mac) {
    $env.PATH = (
        | append $"($env.HOME)/.bun/bin"
        | append $"($env.HOME)/.cargo/bin"
        | append $"($env.HOME)/.local/bin"
        | append $"($env.HOME)/bin"
        | append $"($env.HOME)/go/bin"
        | append /opt/homebrew/bin
        | append /opt/homebrew/opt/rabbitmq/sbin
        | append /opt/homebrew/opt/ruby/bin
        | append /usr/local/bin
        | append /usr/local/sbin
        | append /usr/sbin
        | append /Applications
        | append ($env.PATH | split row (char esep))
    )
}

