# modules
source ~/.config/atuin/init.nu
source ~/.config/zoxide.nu

# use ~/Developer/nu_scripts/modules/background_task/job.nu
use ~/Developer/nu_scripts/modules/data_extraction/ultimate_extractor.nu
use ~/Developer/nu_scripts/modules/formats/remove-diacritics.nu
use ~/Developer/nu_scripts/modules/formats/to-ini.nu
use ~/Developer/nu_scripts/modules/git/git-v2.nu
use ~/Developer/nu_scripts/modules/network/ssh.nu
use ~/Developer/nu_scripts/modules/network/remoting/remoting.nu
use "~/Library/Application Support/nushell/starship.nu"
use ~/Developer/nu_scripts/modules/to-json-schema/to-json-schema.nu
source ~/Developer/nu_scripts/modules/network/sockets/sockets.nu

# asdf
# $env.ASDF_NU_DIR = (brew --prefix asdf | str trim | into string | path join 'libexec')
# source /opt/homebrew/opt/asdf
# /libexec/asdf.nu
