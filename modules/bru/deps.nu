# `deps` to list / table
export def main [formula?: string] {
    mut res = null

    if ($formula != null) {
        $res = (brew deps $formula --include-requirements --topological)

        return (
            $res
            | lines
        )
    } else {
        $res = (brew deps --installed --topological)

        return (
            $res
            | lines
            | parse "{name}: {dependencies}"
            | update dependencies {|e| ($e.dependencies | split row ' ')}
        )
    }
}

export def missing [formula: string] {
    return (brew deps $formula --missing
        | lines
        | parse "{name}: {dependencies}"
    )
}

export def tree [formula?: string] {
    mut res = null

    if ($formula != null) {
        $res = (brew deps $formula --include-requirements --topological --tree)
    } else {
        $res = (brew deps --installed --include-requirements --topological --tree)
    }

    return (
        $res
    )
}