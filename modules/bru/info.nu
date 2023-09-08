# get `cask` info
def info-cask [formula: string, extended?: bool] {
    try {
        mut c = (^brew info --json=v2 --casks $formula | from json | get casks)
        if (not $extended) {
            $c = ($c
                | select token name desc homepage version artifacts
                | insert type 'cask'
                | rename name application description homepage version artifacts
                | update application { |r| $r.application | first }
                | update artifacts { |r|
                    (
                        $r.artifacts
                            | filter { |x| ('app' in $x) or ('binary' in $x) or ('pkg' in $x) }
                            | each { |x|
                                if ('app' in $x) {
                                    return ($x.app | first)
                                }
                                if ('binary' in $x) {
                                    return ($x.binary | first)
                                }
                                if ('pkg' in $x) {
                                    return ($x.pkg | first)
                                }
                            }
                    )
                }
            )
        }
        return ($c | first)
    } catch {|err|
        log debug $err.msg
    }
}

def info-formula [formula: string, extended?: bool] {
    try {
        mut f = (^brew info --json=v2 --formula $formula | from json | get formulae)
        if (not $extended) {
            $f = ($f
                | select name desc homepage license tap build_dependencies dependencies versions caveats keg_only options installed
                | insert type 'formula'
            )
        }
        return ($f | first)
    } catch {|err|
        log debug $"($err.msg)"

        print "\n"
        info-cask $formula $extended
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
