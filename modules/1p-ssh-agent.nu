def spawn [
    command: any   # the command to spawn
] {
    let source_code = (view source $command | str trim -l -c '{' | str trim -r -c '}')
    let job_id = (pueue add -p $"nu --config \"~/.config/nushell/config.nu\" --env-config \"~/.config/nushell/env.nu\" -c '($source_code)'")
    {"job_id": $job_id}
}

def not-running [] {
    return (ps | where name =~ openssh-ssh-agent | is-empty)
}

export def main [] {
    if (not-running) {
        spawn {
            (setsid socat $"UNIX-LISTEN:($env.SSH_AUTH_SOCK),fork" EXEC:"`/mnt/c/Program Files/bin/npiperelay.exe` -ei -s //./pipe/openssh-ssh-agent",nofork) | ignore
        }
    }
}
