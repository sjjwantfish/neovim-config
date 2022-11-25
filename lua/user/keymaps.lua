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

-- Reload Config
vim.api.nvim_create_user_command("Reload", function()
    vim.cmd [[  source ~/.config/nvim/init.lua  ]]
end, { nargs = "?", complete = "dir" })

-- Normal --
keymap("n", "W", "<cmd>w<cr>", opts)
keymap("n", "Q", "<cmd>Bdelete<cr>", opts)
keymap("n", "<c-q>", "<cmd>quitall<cr>", opts)
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

-- Find something
keymap("n", "<Leader>o", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<Leader>p", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
-- keymap("n", "<Leader>b", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<Leader>f", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
-- keymap("n", "<Leader>s", "<cmd>Telescope lsp_document_symbols<cr>", opts)
keymap("n", "<Leader>s", "<cmd>Telescope aerial<cr>", opts)
-- keymap("n", "<leader>m", "<cmd>Telescope marks<cr>", opts)
keymap("n", "<leader>m", "<cmd>Telescope vim_bookmarks all<cr>", opts)
keymap("n", "<Leader><Leader>", "<cmd>Telescope buffers<cr>", opts)

-- nvimtree
keymap("n", "<c-w>", ":NvimTreeToggle<cr>", opts)

-- hopword
keymap("n", "<leader>w", "<cmd>HopWord<cr>", opts)
keymap("n", "<leader>n", "<cmd>HopLine<cr>", opts)
keymap("v", "<leader>w", "<cmd>HopWord<cr>", opts)
keymap("v", "<leader>n", "<cmd>HopLine<cr>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", opts)
keymap("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", opts)

-- Register
-- keymap("n", "<C-c>", "<cmd>Register<CR>", opts)
-- keymap("v", "<C-c>", "<cmd>Register<CR>", opts)
-- keymap("x", "<C-c>", "<cmd>Register<CR>", opts)
-- keymap("i", "<C-c>", "<esc>:Register<CR>", opts)
keymap("n", "<C-c>", "<cmd>Telescope registers<CR>", opts)
keymap("v", "<C-c>", "<cmd>Telescope registers<CR>", opts)
keymap("x", "<C-c>", "<cmd>Telescope registers<CR>", opts)
keymap("i", "<C-c>", "<esc>:Telescope registers<CR>", opts)

-- Format
vim.api.nvim_create_user_command("MyFormat", function()
    if vim.bo.filetype == 'json' then
        vim.cmd [[%!yq --indent 4 .]]
    elseif vim.bo.filetype == 'yaml' then
        vim.cmd [[%!yq --indent 4 -y . ]]
    elseif vim.bo.filetype == 'xml' then
        vim.cmd [[1,$!xmllint --format % ]]
    else
        -- vim.lsp.buf.formatting_sync()
        vim.lsp.buf.format()
    end
end, { nargs = "?", complete = "dir" })
keymap("n", "F", "<cmd>MyFormat<cr>", opts)

-- undotree
keymap("n", "<leader>u", ":UndotreeToggle<CR>", opts)

-- trouble
keymap("n", "<c-t>", ":TroubleToggle<cr>", opts)

-- debugger
keymap("n", "<leader>b", ":DapToggleBreakpoint<CR>", opts)
keymap("n", "<F5>", ":DapToggleRepl<CR>", opts)
keymap("n", "<F4>", ":DapTerminate<CR>", opts)
keymap("n", "<leader>d", ":DapContinue<CR>", opts)
-- keymap("n", "<leader>d", "<cmd>lua require'dapui'.eval()<CR>", opts)
keymap("n", "<leader>d", "<cmd>lua require('dapui').toggle()<CR>", opts)

-- git
-- keymap("n", "<leader>g", ":Telescope lazygit<CR>", opts)
-- keymap("n", "<leader>g", ":LazyGit<CR>", opts)
keymap("n", "<leader>g", ":TermExec cmd=lazygit<CR>", opts)
keymap("n", "tp", ":Gitsigns preview_hunk<CR>", opts)
keymap("n", "trh", ":Gitsigns reset_hunk<CR>", opts)
keymap("n", "trb", ":Gitsigns reset_buffer<CR>", opts)

-- jump tags
keymap("n", "tp", ":lua require('jump-tag').jumpParent()<CR>", opts)
keymap("n", "tn", ":lua require('jump-tag').jumpNexSibling()<CR>", opts)
keymap("n", "ts", ":lua require('jump-tag').jumpPrevSibling()<CR>", opts)
keymap("n", "tc", ":lua require('jump-tag').jumpChild()<CR>", opts)
