export def delds [] = {
    m dir delete dsfiles
}

export def cat [file: string] = {
    bat -p --paging=never ($file | path expand)
}

export def ask [query: string] = {
    sgpt --model=gpt-4 --cache --chat=default $query
}

export def howdoi [query: string] = {
    sgpt --model=gpt-4 --cache --shell $query
}