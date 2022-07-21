-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    open_on_setup_file = false,
    open_on_tab = true,
    auto_reload_on_write = true,
    sync_root_with_cwd = true,
    ignore_ft_on_setup = {
        "startify",
        "dashboard",
        "alpha",
    },
    -- auto_close = true,
    hijack_cursor = false,
    update_cwd = false,
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    -- update_to_buf_dir = {
    --     enable = true,
    --     auto_open = true,
    -- },
    renderer = {
        indent_markers = {
            enable = false,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "before",
            glyphs = {
                default = "",
                symlink = "",
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    deleted = "",
                    untracked = "U",
                    ignored = "◌",
                },
                folder = {
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                },
            },
        }
    },
    actions = {
        use_system_clipboard = true,
        -- change_dir = {
        --     enable = true,
        --     global = false,
        --     restrict_above_cwd = false,
        -- },
        open_file = {
            quit_on_open = false,
            resize_window = true,
            -- window_picker = {
            --     enable = true,
            --     chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            --     exclude = {
            --         filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
            --         buftype = { "nofile", "terminal", "help" },
            --     },
            -- },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    system_open = {
        cmd = nil,
        args = {},
    },
    filters = {
        dotfiles = false,
        custom = {},
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    view = {
        width = 50,
        height = 30,
        hide_root_folder = true,
        side = "left",
        mappings = {
            custom_only = false,
            list = {
                { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
                { key = "h", cb = tree_cb "close_node" },
                { key = "v", cb = tree_cb "vsplit" },
            },
        },
        number = true,
        relativenumber = true,
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    -- show_icons = {
    --     git = 1,
    --     folders = 1,
    --     files = 1,
    --     folder_arrows = 1,
    --     tree_width = 30,
    -- },
}
