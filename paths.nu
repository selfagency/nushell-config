# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# $env.PATH = ($env.PATH | split row (char esep) | prepend '/some/path')

$env.BUN_INSTALL = $"($env.HOME)/.bun"

$env.PATH = (
    | append $"($env.BUN_INSTALL)/bin"
    | append $"($env.HOME)/.cargo/bin"
    | append $"($env.HOME)/.local/bin"
    | append $"($env.HOME)/bin"
    | append $"($env.HOME)/go/bin"
    | append /opt/homebrew/bin
    | append /opt/homebrew/opt/rabbitmq/sbin
    | append /Applications
    | append /usr/local/lib/ruby/gems/3.0.0/bin
    | append /usr/local/opt/ruby/bin
    | append /usr/local/bin
    | append /usr/local/sbin
    | append /usr/sbin
    | append ($env.PATH | split row (char esep))
)

$env.PKG_CONFIG_PATH = []
    | append /usr/local/opt/ruby/lib/pkgconfig
    | append /usr/local/opt/xorgproto/share/pkgconfig