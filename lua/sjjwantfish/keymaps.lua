vim.cmd [[
  augroup packer_user_config autocmd! autocmd BufWritePost keymaps.lua source <afile>  end
]]
local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

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

-- split windows
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
-- keymap("n", "<Leader>s", "<cmd>Telescope lsp_document_symbols<cr>", opts)
keymap("n", "<Leader>s", "<cmd>Telescope aerial<cr>", opts)

keymap("n", "<c-t>", ":NvimTreeToggle<cr>", opts)

keymap("n", "fw", "<cmd>HopWord<cr>", opts)
keymap("n", "fl", "<cmd>HopLine<cr>", opts)
keymap("v", "fw", "<cmd>HopWord<cr>", opts)
keymap("v", "fl", "<cmd>HopLine<cr>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("n", "F", "<cmd>lua vim.lsp.buf.formatting_sync()<cr>", opts)
keymap("n", "<leader>u", ":UndotreeToggle<CR>", opts)
-- keymap("v", "<leader>m", ":call NERDComment('x', 'toggle')<cr>", opts)

-- tab indent
keymap("v", "<TAB>", ":s/^/    /g<cr>:noh<cr>", opts)
keymap("v", "<S-TAB>", ":s/^    //g<cr>:noh<cr>", opts)

