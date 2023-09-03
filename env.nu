# Nushell Environment Config File
#
# version = "0.84.0"

$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

# Directories to search for scripts when calling source or use
$env.NU_LIB_DIRS = []

# Directories to search for plugin binaries when calling register
$env.NU_PLUGIN_DIRS = []

source ~/.config/nushell/paths.nu       # paths
source ~/.config/nushell/envvars.nu     # envvars
source ~/.config/nushell/privatevars.nu # private vars

let user = (whoami) | str trim
if ($user != 'root') {
    fnm env --shell power-shell | fnm-nushell | from json | load-env # node manager
}