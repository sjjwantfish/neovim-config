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

require("lazy").setup({
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    "nvim-lua/popup.nvim",   -- An implementation of the Popup API from vim in Neovim
    "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
    "nvim-tree/nvim-web-devicons",

    "nvim-telescope/telescope.nvim",
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
    },
    "folke/which-key.nvim",
    {
        "folke/tokyonight.nvim",
        opts = {
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },
    },
    'lewis6991/gitsigns.nvim',
    { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    },

    "numToStr/Comment.nvim",

    -- buffer
    "akinsho/bufferline.nvim",

    -- snippets
    "L3MON4D3/LuaSnip", --snippet engine
    "rafamadriz/friendly-snippets", -- a bunch of snippets to use
    -- cmp
    "hrsh7th/nvim-cmp",         -- The completion plugin
    "hrsh7th/cmp-buffer",       -- buffer completions
    "hrsh7th/cmp-path",         -- path completions
    "hrsh7th/cmp-cmdline",      -- cmdline completions
    "saadparwaiz1/cmp_luasnip", -- snippet completions
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    { 'tzachar/cmp-tabnine',        build = './install.sh', dependencies = 'hrsh7th/nvim-cmp' },
    -- lsp
    "neovim/nvim-lspconfig",            -- enable LSP
    "williamboman/mason-lspconfig.nvim",
    "tamago324/nlsp-settings.nvim",     -- language server settings defined in json for
    "jose-elias-alvarez/null-ls.nvim",  -- for formatters and linters
    { "williamboman/mason.nvim" },      -- lsp installer
    { "jayp0521/mason-null-ls.nvim" },
    --  {"WhoIsSethDaniel/mason-tool-installer.nvim"}
    -- dap
    "mfussenegger/nvim-dap",
    { "jayp0521/mason-nvim-dap.nvim" },
    "nvim-telescope/telescope-dap.nvim",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    },
    --  "nvim-treesitter/playground"
    "p00f/nvim-ts-rainbow",




})
