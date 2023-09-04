# `list` to table
export def main [--extended (-e)] {
    mut res = (^brew info --installed --json) | from json

    if (not $extended) {
        $res = ($res
            | select name desc homepage license installed pinned outdated
            | update installed {|r| $r.installed | first | get version}
        )
    }
    return $res
}