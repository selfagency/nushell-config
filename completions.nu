# completions
# source ~/.config/nushell/modules/nu_scripts/custom-completions/auto-generate/parse-fish.nu
# use ~/.config/nushell/modules/nu_scripts/custom-completions/auto-generate/parse-help.nu
use ~/.config/nushell/modules/nu_scripts/custom-completions/git/git-completions.nu
use ~/.config/nushell/modules/nu_scripts/custom-completions/npm/npm-completions.nu
use ~/.config/nushell/modules/nu_scripts/custom-completions/tealdeer/tldr-completions.nu
use ~/.config/nushell/modules/nu_scripts/custom-completions/yarn/yarn-completion.nu
use ~/.config/nushell/modules/nu_scripts/custom-completions/zellij/zellij-completions.nu

#zoxide completion
export def "nu-complete zoxide path" [line : string, pos: int] {
    let prefix = ($line | str trim | split row ' ' | append ' ' | skip 1 | get 0)
    let data = (^zoxide query $prefix --list | lines)
    return {
        completions: $data,
        options: {
            completion_algorithm: "fuzzy"
        }
    }
}
