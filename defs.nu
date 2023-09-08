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

export def hosts [--exclude-localhost (-e)] = {
    mut res = open /etc/hosts | lines | filter {|x| not ($x | str starts-with '#')} | parse "{ip} {hostname}" | update hostname {|h| ($h.hostname | str trim)}

    if ($exclude_localhost) {
        $res = ($res
            | filter {|x| not ($x.hostname == 'localhost')}
            | filter {|x| not ($x.hostname == 'broadcasthost')}
            | filter {|x| not ($x.hostname | str ends-with 'docker.internal')}
        )
    }

    return $res
}

export def upgrade [] = {
    topgrade -y --no-retry --skip-notify
}
