local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
    return
end

mason.setup {
    -- The directory in which to install packages.
    -- install_root_dir = path.concat { vim.fn.stdpath "data", "mason" },

    -- Where Mason should put its bin location in your PATH. Can be one of:
    -- - "prepend" (default, Mason's bin location is put first in PATH)
    -- - "append" (Mason's bin location is put at the end of PATH)
    -- - "skip" (doesn't modify PATH)
    ---@type '"prepend"' | '"append"' | '"skip"'
    PATH = "prepend",

    pip = {
        -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
        -- and is not recommended.
        --
        -- Example: { "--proxy", "https://proxyserver" }
        install_args = {},
    },

    -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
    -- debugging issues with package installations.
    log_level = vim.log.levels.INFO,

    -- Limit for the maximum amount of packages to be installed at the same time. Once this limit is reached, any further
    -- packages that are requested to be installed will be put in a queue.
    max_concurrent_installers = 4,

    github = {
        -- The template URL to use when downloading assets from GitHub.
        -- The placeholders are the following (in order):
        -- 1. The repository (e.g. "rust-lang/rust-analyzer")
        -- 2. The release version (e.g. "v0.3.0")
        -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
        download_url_template = "https://github.com/%s/releases/download/%s/%s",
    },

    ui = {
        -- Whether to automatically check for new versions when opening the :Mason window.
        check_outdated_packages_on_open = true,

        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "none",

        icons = {
            -- The list icon to use for installed packages.
            package_installed = "✓",
            -- The list icon to use for packages that are installing, or queued for installation.
            package_pending = "➜",
            -- The list icon to use for packages that are not installed.
            package_uninstalled = "✗"
            -- package_installed = "◍",
            -- package_pending = "◍",
            -- package_uninstalled = "◍",
        },

        keymaps = {
            -- Keymap to expand a package
            toggle_package_expand = "<CR>",
            -- Keymap to install the package under the current cursor position
            install_package = "i",
            -- Keymap to reinstall/update the package under the current cursor position
            update_package = "u",
            -- Keymap to check for new version for the package under the current cursor position
            check_package_version = "c",
            -- Keymap to update all installed packages
            update_all_packages = "U",
            -- Keymap to check which installed packages are outdated
            check_outdated_packages = "C",
            -- Keymap to uninstall a package
            uninstall_package = "X",
            -- Keymap to cancel a package installation
            cancel_installation = "<C-c>",
            -- Keymap to apply language filter
            apply_language_filter = "<C-f>",
        },
    },
}

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
    return
end
mason_lspconfig.setup({
    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "sumneko_lua" }
    -- This setting has no relation with the `automatic_installation` setting.
    ensure_installed = require("user.lsp.config").servers,
    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    automatic_installation = false,
})

-- setup null-ls
require("user.lsp.null-ls")
require("mason-null-ls").setup(
    {
        -- A list of sources to install if they're not already installed.
        -- This setting has no relation with the `automatic_installation` setting.
        ensure_installed = require("user.lsp.config").null_ls,
        -- Run `require("null-ls").setup`.
        -- Will automatically install masons tools based on selected sources in `null-ls`.
        -- Can also be an exclusion list.
        -- Example: `automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }`
        automatic_installation = false,

        -- Whether sources that are installed in mason should be automatically set up in null-ls.
        -- Removes the need to set up null-ls manually.
        -- Can either be:
        -- 	- false: Null-ls is not automatically registered.
        -- 	- true: Null-ls is automatically registered.
        -- 	- { types = { SOURCE_NAME = {TYPES} } }. Allows overriding default configuration.
        -- 	Ex: { types = { eslint_d = {'formatting'} } }
        automatic_setup = false,
    }
)

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end
for _, server in pairs(require("user.lsp.config").servers) do
    local opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }
    local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
    if has_custom_opts then
        opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
    end
    lspconfig[server].setup(opts)
end

