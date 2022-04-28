vim.g.coc_global_extensions = {
    'coc-json',
    'coc-vimlsp',
    'coc-marketplace',
    'coc-git',
    'coc-yank',
    'coc-eslint',
    'coc-actions',
}

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--- " 粘贴板历史
keymap("n", "<leader>g", ":<C-u>CocList -A --normal yank<cr>", opts)

-- " Use <c-space> to trigger completion.
keymap("i", "<c-space>", "coc#refresh", { noremap = true, silent = true, expr = true })

-- " Make <CR> auto-select the first completion item and notify coc.nvim to
-- " format on enter, <cr> could be remapped by other vim plugin
vim.cmd([[
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : check_back_space() ? "\<TAB>" : coc#refresh() 
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
]])

vim.api.nvim_exec([[
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
]], true)

-- Use <c-space> to trigger completion.
keymap('i', '<c-space>', "coc#refresh()", { noremap = true, silent = true, expr = true })

-- Make <CR> auto-select the first completion item and notify coc.nvim to
-- format on enter, <cr> could be remapped by other vim plugin
vim.cmd([[
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
]])

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', opts)
keymap('n', ']g', '<Plug>(coc-diagnostic-next)', opts)

-- GoTo code navigation.
keymap('n', 'gd', '<Plug>(coc-definition)', opts)
keymap('n', 'gy', '<Plug>(coc-type-definition)', opts)
keymap('n', 'gi', '<Plug>(coc-implementation)', opts)
keymap('n', 'gr', '<Plug>(coc-references)', opts)
