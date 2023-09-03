let hooks = {
    pre_prompt: [{ null }]
    pre_execution: [{ null }]
    env_change: {
        PWD: [
            {|before, after|
                try {
                    if (ls .git | length) > 0 and (git status -s | str length) > 0 { onefetch }
                }
            }
            {|before, after|try {print (ls -a | sort-by -i type name | grid -c)}}
      	    {|before, after|
      		    zoxide add -- $env.PWD
      	    }
        ]
    }
    display_output: "if (term size).columns >= 100 { table -e } else { table }"
    command_not_found: {|cmd|
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

        $"\ndid you mean?\n($pretty_commands | str join "\n")"
    }
}