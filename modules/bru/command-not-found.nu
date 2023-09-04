# `command_not_found`
def command-not-found [cmd: string] {
    let txt = null

    if not (
        (cmd | str contains '-h') or
        (cmd | str contains '--help') or
        (cmd | str contains '--usage') or
        (cmd | str contains '-?')
    ) { txt = (^brew which-formula --explain $cmd | ignore) }

    if (txt == null) {
        bru command-not-found-handler
    } else {
        print $txt
    }
}

# `command_not_found` handler
export def main [] {
    let cmd = history | last 1 | get command.0
    command-not-found $cmd
}