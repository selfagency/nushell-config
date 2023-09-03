export def dir [path?: string] {
    if ($path == null) {
        ls -a
    } else {
        ls -a $path
    } | sort-by -i type name | grid -c
}

export def delds [] = {
    m dir delete dsfiles
}

export def cat [file: string] = {
    bat -p --paging=never ($file | path expand)
}

export def gpt [query: string] = {
    sgpt --model=gpt-4 --cache --chat=default $query
}

export def howdoi [query: string] = {
    sgpt --model=gpt-4 --cache --shell $query
}

# export def fuck [] = {
#     thefuck (history | last 1 | get command | get 0)
# }
