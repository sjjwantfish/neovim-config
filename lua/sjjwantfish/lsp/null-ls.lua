local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = false,
    sources = {
        -- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
        -- python
        formatting.black.with({ extra_args = { "--fast" } }),
        formatting.sqlformat,
        -- c++
        -- formatting.astyle.with({ extra_args = { "--quiet" } }),
        formatting.clang_format,

        -- formatting.gofmt,
        -- formatting.autopep8,
        -- formatting.stylua,
        -- diagnostics.pylint,
        -- python
        diagnostics.flake8,
        -- sql
        diagnostics.sqlfluff,
        -- c++
        diagnostics.cppcheck.with({ extra_args = { "--enable=warning,style,performance,portability", "--template=gcc",
            "--inconclusive",
            "$FILENAME" } }),
    },
})
