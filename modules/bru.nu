use std log

# completions
# fetch
# graph
# help
# home
# install
# link
# log
# migrate
# missing
# nodenv-sync
# options
# outdated
# pin
# postgresql-upgrade-database
# postinstall
# pyenv-sync
# rbenv-sync
# readall
# reinstall
# search
# services
# shellenv
# tap
# tap-info
# uninstall
# unlink
# unpin
# untap
# update
# update-report
# update-reset
# upgrade
# uses
# vendor-install
# which-formula
# which-update

export-env {
    $env.PATH = ($env.PATH
        | prepend $"(^brew --prefix)/sbin"
        | prepend $"(^brew --prefix)/bin"
    )
}

export use ./bru/command-not-found.nu
export use ./bru/config.nu
export use ./bru/deps.nu
export use ./bru/doctor.nu
export use ./bru/info.nu *
export use ./bru/leaves.nu
export use ./bru/list.nu
export use ./bru/search.nu
export use ./bru/services.nu

export alias ls = list

export def main [
    ...args: any
] {
    # flags
    # --cache,
    # --caskroom,
    # --cellar,
    # --env,
    # --prefix,
    # --repository,
    # --version,
    # --debug (-d),
    # --quiet (-q),
    # --verbose (-v),
    # --help (-h)

    return (^brew $args)
}
