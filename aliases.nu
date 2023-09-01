# macos kludge
def load [arg, --raw (-r)] { if $raw { open -r $arg } else { open $arg } }
alias open = ^open

# aliases
alias tailscale = /Applications/Tailscale.app/Contents/MacOS/Tailscale
alias tower = gittower
alias nvm = fnm
alias pick = pu