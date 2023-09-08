# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# $env.PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
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
