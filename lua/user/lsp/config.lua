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
local null_ls = {
    "eslint_d",
    "misspell",
    -- "luacheck",
    -- python
    "flake8",
    "black",
    "isort",
}

return {
    servers = servers,
    null_ls = null_ls,
}
