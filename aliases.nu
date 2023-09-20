let is_linux: bool = (sys | get host.long_os_version | str downcase | str contains "linux")
let is_wsl: bool = (sys | get host.kernel_version | str downcase | str contains "microsoft")
let is_mac: bool = (sys | get host.long_os_version | str downcase | str contains "macos")

if ($is_mac) {
    # open kludge
    def load [arg, --raw (-r)] { if $raw { open -r $arg } else { open $arg } }
    alias open = ^open

    # aliases
    alias tailscale = /Applications/Tailscale.app/Contents/MacOS/Tailscale
}

alias tower = gittower
alias nvm = fnm
alias pick = htmlq
