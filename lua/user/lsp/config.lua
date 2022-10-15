local mason_servers = {
    -- python
    'pyright',

    -- html js vue
    'eslint_d',
    'eslint-lsp',
    'vue-language-server',

    -- lua
    'lua-language-server',
    -- 'luacheck',

    -- vim
    'vim-language-server',
    -- 'vint',

    -- golang
    'gopls',
    -- 'gomodifytags',
    -- 'gotests',
    -- { 'golangci-lint', version = 'v1.47.0' },
    -- 'gofumpt',
    -- 'golines',
    -- 'revive',
    -- 'staticcheck',

    -- shell
    'bashls',
    -- 'shellcheck',
    -- 'bash-language-server',
    -- 'shfmt',

    -- json
    "json-lsp",
    -- 'jsonls',

    -- other
    -- 'editorconfig-checker',
    -- 'impl',
    'misspell',
}
local servers = {
    -- python
    'pyright',
    -- html js vue
    'eslint',
    'vuels',
    -- lua
    'sumneko_lua',
    -- golang
    'gopls',
    -- shell
    'bashls',
    -- json
    'jsonls',
    -- vim
    'vimls',
}

local lspconfig = require("lspconfig")
for _, server in pairs(servers) do
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

return {
    mason = mason_servers,
    servers = servers,
}
