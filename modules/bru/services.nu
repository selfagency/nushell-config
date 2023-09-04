# `services` to table
export def main [subcommand: string, service: string] {
    if ($subcommand == 'list' or $subcommand == 'ls') {
        let services = (^brew services list --json)
            | from json
            | sort-by name
            | update status {|r|
                if ($r.status == 'none') {
                    'stopped'
                } else {
                    $r.status
                }
            }
        return $services
    } else {
        return (^brew services $subcommand $service)
    }
}