$env.PATH | where {|it| $it | str contains ".pyenv/shims" } | drop
$env.PATH | append /Users/daniel/.pyenv/shims
$env.PYENV_SHELL = nu

def pyenv [cmd:string, arguments?:list<string>] {
  if (($cmd == "rehash") or ($cmd == "shell")) {
    pyenv $"sh-($cmd)" $arguments
  } else {
    pyenv $cmd $arguments
  }
}

# pyenv rehash | ignore
