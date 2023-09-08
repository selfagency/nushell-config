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
        ]
    }
    display_output: "if (term size).columns >= 100 { table -e } else { table }"
    command_not_found: []
}
