vim.cmd [[
  augroup packer_user_config autocmd! autocmd BufWritePost keymaps.lua source <afile>  end
]]
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
keymap("n", "W", "<cmd>w<cr>", opts)
keymap("n", "Q", "<cmd>Bdelete<cr>", opts)
keymap("n", "<c-n>", "5j", opts)
keymap("n", "<c-m>", "5k", opts)
-- -- 复制到系统粘贴板
-- keymap("v", "<Leader>y", "\"+y", opts)
-- -- 将系统粘贴板内容粘贴
-- keymap("n", "<Leader>p", "\"+p", opts)

-- 分屏
keymap("n", "<Leader>l", "<cmd>set splitright<CR><cmd>vsplit<CR>", opts)
keymap("n", "<Leader>h", "<cmd>set nosplitright<CR><cmd>vsplit<CR>", opts)
keymap("n", "<Leader>j", "<cmd>set splitbelow<CR><cmd>split<CR>", opts)
keymap("n", "<Leader>k", "<cmd>set nosplitbelow<CR><cmd>split<CR>", opts)
-- Better window navigation
keymap("n", "<c-l>", "<C-w>l", opts)
keymap("n", "<c-h>", "<C-w>h", opts)
keymap("n", "<c-j>", "<C-w>j", opts)
keymap("n", "<c-k>", "<C-w>k", opts)
-- Resize with arrows
keymap("n", "<A-up>", " :res +2<CR>", opts)
keymap("n", "<A-down>", " :res -2<CR>", opts)
keymap("n", "<A-left>", " :vertical resize-2<CR>", opts)
keymap("n", "<A-right>", " :vertical resize+2<CR>", opts)

keymap("n", "<Leader>o", "<cmd>Telescope find_files<cr>", opts)
-- keymap("n", "<Leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({preview = true}))<cr>", opts)
keymap("n", "<Leader>p", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
keymap("n", "<Leader>b", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<Leader>f", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
keymap("n", "<Leader>s", "<cmd>Telescope lsp_document_symbols<cr>", opts)

keymap("n", "<c-e>", ":NvimTreeToggle<cr>", opts)

-- vim.api.nvim_set_keymap('n', 'fj', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", {})
-- vim.api.nvim_set_keymap('n', 'fk', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", {})
-- keymap("n", "f","<cmd>HopPattern<cr>", opts)
keymap("n", "fw","<cmd>HopWord<cr>", opts)
keymap("n", "fl","<cmd>HopLine<cr>", opts)



-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("n", "F", "<cmd>lua vim.lsp.buf.formatting_sync()<cr>", opts)
keymap("n", "<leader>u", ":UndotreeToggle<CR>", opts)
-- keymap("v", "<leader>m", ":call NERDComment('x', 'toggle')<cr>", opts)

--
-- -- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
--
-- -- Insert --
-- -- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)
--
-- -- Visual --
-- -- Stay in indent mode
-- keymap("v", "<", "<gv", opts)
-- keymap("v", ">", ">gv", opts)
--
-- -- Move text up and down
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- keymap("v", "p", '"_dP', opts)
--
-- -- Visual Block --
-- -- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
--
-- -- Terminal --
-- -- Better terminal navigation
-- -- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- -- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- -- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- -- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
