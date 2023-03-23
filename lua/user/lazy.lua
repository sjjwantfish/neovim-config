local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

vim.g.mapleader = " "
lazy.setup({
	-- "folke/which-key.nvim",
	-- { "folke/neoconf.nvim", cmd = "Neoconf" },
	-- "folke/neodev.nvim",
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",

	"nvim-telescope/telescope.nvim",
 {
  "nvim-neo-tree/neo-tree.nvim",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
  }
})
