# `config` to table
export def main [key?: string] {
    let conf = (^brew config | lines | parse "{key}: {value}")

    if ($key != null) {
        try {
            return ($conf | where key =~ $key | get value)
        } catch {|err|
            print $"Key `($key)` does not exist"
        }
    } else {
        return $conf
    }
}