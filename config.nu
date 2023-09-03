# Nushell Config File
# version = "0.84.0"
source ~/.config/nushell/keybindings.nu # keybindings
source ~/.config/nushell/hooks.nu       # hooks
source ~/.config/nushell/menus.nu       # menus

$env.config = {
    show_banner: false

    ls: {
        use_ls_colors: true
        clickable_links: true
    }

    rm: {
        always_trash: true
    }

    cd: {
        abbreviations: true
    }

    table: {
        mode: light
        index_mode: auto
        show_empty: true
        padding: { left: 1, right: 1 }
        trim: {
            methodology: truncating
            wrapping_try_keep_words: true
            truncating_suffix: "..."
        }
        header_on_separator: false
    }

    explore: {
        try: {
            border_color: {fg: "white"}
        },
        status_bar_background: {fg: "#1D1F21", bg: "#C4C9C6"},
        command_bar_text: {fg: "#C4C9C6"},
        highlight: {fg: "black", bg: "yellow"},
        status: {
            error: {fg: "white", bg: "red"},
            warn: {}
            info: {}
        },
        table: {
            split_line: {fg: "#404040"},
            selected_cell: {},
            selected_row: {},
            selected_column: {},
            show_cursor: true,
            line_head_top: true,
            line_head_bottom: true,
            line_shift: true,
            line_index: true,
        },
        config: {
            border_color: {fg: "white"}
            cursor_color: {fg: "black", bg: "light_yellow"}
        },
    }

    history: {
        max_size: 100_000
        sync_on_enter: true
        file_format: "plaintext"
        isolation: false
    }

    completions: {
        case_sensitive: false
        quick: true
        partial: true
        algorithm: "prefix"
        external: {
            enable: true
            max_results: 100
            completer: {|spans|
                carapace $spans.0 nushell $spans | from json
            }
        }
    }

    filesize: {
        metric: true
        format: "auto"
    }

    cursor_shape: {
        emacs: blink_block
        vi_insert: blink_block
        vi_normal: blink_block
    }

    use_grid_icons: true
    footer_mode: "25"
    float_precision: 2
    buffer_editor: ""
    use_ansi_coloring: true
    bracketed_paste: true
    edit_mode: emacs
    shell_integration: true
    hooks: $hooks
    menus: $menus
    keybindings: $keybindings
}

# theme
use ~/Developer/nu_scripts/themes/themes/outrun-dark.nu
$env.config = ($env.config | merge {color_config: (outrun-dark)})

source ~/.config/nushell/completions.nu # completions
source ~/.config/nushell/defs.nu        # defs
source ~/.config/nushell/modules.nu     # modules
source ~/.config/nushell/aliases.nu     # aliases
source ~/.config/nushell/prompt.nu      # prompt

neofetch

