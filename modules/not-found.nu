export-env {
    def not-found [cmd: string] {
        let commands_in_path = (
            $env.PATH | each {|directory|
                if ($directory | path exists) {
                    ls $directory | get name | path parse | update parent "" | path join
                }
            }
            | flatten
            | wrap cmd
        )

        let closest_commands = (
            $commands_in_path
            | insert distance {|it|
                $it.cmd | str distance $cmd
            }
            | uniq
            | sort-by distance
            | get cmd
            | first 3
        )

        let pretty_commands = (
            $closest_commands | each {|cmd|
                $"    (ansi {fg: "default" attr: "di"})($cmd)(ansi reset)"
            }
        )

        return $"\ndid you mean?\n($pretty_commands | str join "\n")"
    }

    if (not ($env | default false __notfound_hooked | get __notfound_hooked)) {
        $env.__notfound_hooked = true
        $env.config.hooks.command_not_found = $env.config.hooks.command_not_found
            | append {|cmd| not-found $cmd}
    }
}
