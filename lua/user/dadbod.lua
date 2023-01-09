vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_auto_execute_table_helpers = 1
vim.g.db_ui_table_helpers = {
    mysql = {
        Structure = 'SHOW CREATE TABLE {table};'
    }
}
vim.cmd [[
  autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
]]
-- vim.opt.db_ui_use_nerd_fonts = 1
-- vim.opt.db_ui_use_nerd_fonts = {
--     expanded = {
--         db = '▾ ',
--         buffers = '▾ ',
--         saved_queries = '▾ ',
--         schemas = '▾ ',
--         schema = '▾ פּ',
--         tables = '▾ 藺',
--         table = '▾ ',
--     },
--     collapsed = {
--         db = '▸ ',
--         buffers = '▸ ',
--         saved_queries = '▸ ',
--         schemas = '▸ ',
--         schema = '▸ פּ',
--         tables = '▸ 藺',
--         table = '▸ ',
--     },
--     saved_query = '',
--     new_query = '璘',
--     tables = '離',
--     buffers = '﬘',
--     add_connection = '',
--     connection_ok = '✓',
--     connection_error = '✕',
-- }
