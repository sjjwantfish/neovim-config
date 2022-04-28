package.path = package.path .. os.getenv("HOME") .. ".config/nvim/lua"
-- 立即生效
-- vim.cmd("autocmd BufWritePost $MYVIMRC source $MYVIMRC"
require "sjjwantfish.keymaps"
require "sjjwantfish.options"
require "sjjwantfish.plugins"
require "sjjwantfish.colorscheme"
require "sjjwantfish.cmp"
require "sjjwantfish.lsp"
require "sjjwantfish.telescope"
require "sjjwantfish.treesitter"
require "sjjwantfish.autopairs"
require "sjjwantfish.nerdcommenter"
require "sjjwantfish.gitsigns"
require "sjjwantfish.nvim-tree"
require "sjjwantfish.bufferline"
require "sjjwantfish.toggleterm"
require "sjjwantfish.indentLine"

-- vim.cmd("source " .. os.getenv("HOME") .. "/.config/nvim/keymaps.vim")

-- require "sjjwantfish.coc"
-- vim.cmd("source " .. os.getenv("HOME") .. "/.config/nvim/coc.vim")
-- vim.cmd("source " .. os.getenv("HOME") .. "/.config/nvim/airline.vim")
-- vim.cmd("source " .. os.getenv("HOME") .. "/.config/nvim/auto-pairs.vim")
-- vim.cmd("source " .. os.getenv("HOME") .. "/.config/nvim/coc-highlight.vim")
-- vim.cmd("source " .. os.getenv("HOME") .. "/.config/nvim/fzf.vim")
-- vim.cmd("source " .. os.getenv("HOME") .. "/.config/nvim/indentLine.vim")
-- vim.cmd("source " .. os.getenv("HOME") .. "/.config/nvim/nerdcommenter.vim")
-- vim.cmd("source " .. os.getenv("HOME") .. "/.config/nvim/nerdtree.vim")
-- vim.cmd("source " .. os.getenv("HOME") .. "/.config/nvim/nvim-treesitter.vim")
-- vim.cmd("source " .. os.getenv("HOME") .. "/.config/nvim/pipe-mysql.vim")
-- vim.cmd("source " .. os.getenv("HOME") .. "/.config/nvim/rainbow_parentheses.vim")
-- vim.cmd("source " .. os.getenv("HOME") .. "/.config/nvim/tagbar.vim")
-- vim.cmd("source " .. os.getenv("HOME") .. "/.config/nvim/ultisnips.vim")
-- vim.cmd("source " .. os.getenv("HOME") .. "/.config/nvim/undotree.vim")
-- vim.cmd("source " .. os.getenv("HOME") .. "/.config/nvim/vim-easymotion.vim")
-- vim.cmd("source " .. os.getenv("HOME") .. "/.config/nvim/vim-go.vim")


