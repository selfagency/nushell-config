# get `cask` info
def info-cask [formula: string, extended?: bool] {
    try {
        mut c = (^brew info --json=v2 --casks $formula | from json | get casks)
        if (not $extended) {
            $c = ($c
                | first
                | select token name desc homepage version caveats
                | insert type 'cask'
                | update name {|r| $r.name | first}
            )
        } else {
            $c = ($c | first)
        }
        return $c
    } catch {|err|
        log debug $err.msg
    }
}

def info-formula [formula: string, extended?: bool] {
    try {
        mut f = (^brew info --json=v2 --formula $formula | from json | get formulae)
        if (not $extended) {
            $f = ($f
                | first
                | select name desc homepage tap build_dependencies dependencies versions caveats
                | insert type 'formula'
            )
        } else {
            $f = ($f | first)
        }
        return $f
    } catch {|err|
        log debug $err.msg
    }
}

export def desc [formula: string, --cask (-c)] {
    mut desc = ""
    if ($cask) {
        $desc = (main $formula --cask)
    } else {
        $desc = (main $formula)
    }
    return $"($desc.name): ($desc.desc)"
}

export def casks [] {
  return (^brew casks | lines | parse '{name}')
}

export def formulae [] {
  return (^brew formulae | lines | parse '{name}')
}

# `info` to table
export def main [formula: string, --extended (-e), --cask (-c)] {
    mut info = [{}]

    if ($cask) {
        $info = (info-cask $formula $extended)
    } else {
        $info = (info-formula $formula $extended)
    }

    return $info
}