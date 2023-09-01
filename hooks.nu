let hooks = {
    pre_prompt: [{ null }] # run before the prompt is shown
    pre_execution: [{ null }] # run before the repl input is run
    env_change: {
        PWD: [
            {|before, after|try {print (ls | sort-by -i type name | grid -c)}}
            {|before, after|
            {||
    			try {
        			if (ls .git | length) > 0 and (git status -s | str length) > 0 {
            			onefetch
        			}
                }
            }}
      	    {|before, after|
      		    zoxide add -- $env.PWD
      	    }
        ] # run if the PWD environment is different since the last repl input
    }
    display_output: "if (term size).columns >= 100 { table -e } else { table }" # run to display the output of a pipeline
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
    } # return an error message when a command is not found
}