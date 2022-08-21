local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins hereplugin
return packer.startup(function(use)
    -- use "sjjwantfish/db-diver.nvim"
    use "xiyaowong/telescope-emoji.nvim"

    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    -- colorscheme
    use "rafamadriz/neon"
    use 'folke/tokyonight.nvim'
    -- use "andersevenrud/nordic.nvim"
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    use "akinsho/bufferline.nvim"
    use "moll/vim-bbye"
    use "akinsho/toggleterm.nvim"
    -- status/tabline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }
    -- selection
    use "gcmt/wildfire.vim"
    -- indent
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup {
                show_end_of_line = true,
                space_char_blankline = " ",
            }
        end
    }
    -- folder
    use { 'anuvyklack/fold-preview.nvim',
        requires = 'anuvyklack/keymap-amend.nvim',
        config = function()
            require('fold-preview').setup()
        end
    }
    -- use { 'anuvyklack/pretty-fold.nvim',
    --     requires = 'anuvyklack/nvim-keymap-amend', -- only for preview
    --     config = function()
    --         require('pretty-fold').setup()
    --         require('pretty-fold.preview').setup()
    --     end
    -- }
    -- outline
    use 'stevearc/aerial.nvim'

    -- greeter
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.startify'.config)
        end
    }
    -- show keymap
    use {
        "folke/which-key.nvim",
        -- config = function()
        --     require("which-key").setup {
        --         -- your configuration comes here
        --         -- or leave it empty to use the default settings
        --         -- refer to the configuration section below
        --     }
        -- end
    }
    use "mbbill/undotree"
    -- -- tabout
    -- use {
    --     'abecodes/tabout.nvim',
    --     -- config = function()
    --     --     require('tabout').setup {
    --     --         tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
    --     --         backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
    --     --         act_as_tab = false, -- shift content if tab out is not possible
    --     --         act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
    --     --         enable_backwards = false, -- well ...
    --     --         completion = true, -- if the tabkey is used in a completion pum
    --     --         tabouts = {
    --     --             { open = "'", close = "'" },
    --     --             { open = '"', close = '"' },
    --     --             { open = '`', close = '`' },
    --     --             { open = '(', close = ')' },
    --     --             { open = '[', close = ']' },
    --     --             { open = '{', close = '}' }
    --     --         },
    --     --         ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
    --     --         exclude = {} -- tabout will ignore these filetypes
    --     --     }
    --     -- end,
    --     wants = { 'nvim-treesitter' }, -- or require if not used so far
    --     after = { 'nvim-cmp' } -- if a completion plugin is using tabs load it before
    -- }

    use "MattesGroeger/vim-bookmarks"
    use "tom-anders/telescope-vim-bookmarks.nvim"
    use { 'chentoast/marks.nvim' }

    use {
        'phaazon/hop.nvim',
        branch = 'v1', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }

    -- trouble
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }
    -- -- Load on a combination of conditions: specific filetypes or commands
    -- -- Also run code after load (see the "config" key)
    -- use {
    --     'w0rp/ale',
    --     ft = { 'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex' },
    --     cmd = 'ALEEnable',
    --     config = 'vim.cmd[[ALEEnable]]'
    -- }

    -- Plugins can have post-install/update hooks
    -- use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview' }
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
    -- comment
    use 'numToStr/Comment.nvim'
    -- use {
    --     'numToStr/Comment.nvim',
    --     config = function()
    --         require('Comment').setup()
    --     end
    -- }
    -- use {
    --     "terrortylor/nvim-comment",
    --     config = function()
    --         require('nvim_comment').setup({
    --             -- Linters prefer comment and line to have a space in between markers
    --             marker_padding = true,
    --             -- should comment out empty or whitespace only lines
    --             comment_empty = true,
    --             -- trim empty comment whitespace
    --             comment_empty_trim_whitespace = true,
    --             -- Should key mappings be created
    --             create_mappings = true,
    --             -- Normal mode mapping left hand side
    --             line_mapping = "gm",
    --             -- Visual/Operator mapping left hand side
    --             operator_mapping = "gm",
    --             -- text object mapping, comment chunk,,
    --             -- comment_chunk_text_object = "ic",
    --             -- Hook function to call before commenting takes place
    --             -- hook = nil
    --         })
    --     end
    -- }

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
    use "j-hui/fidget.nvim" -- show lsp progress
    -- debugger
    use "ravenxrz/DAPInstall.nvim" -- fork from Pocco81/dap-buddy.nvim   install debugger
    -- use "Pocco81/dap-buddy.nvim" -- install debugger
    -- use "ravenxrz/nvim-dap"  -- fork from mfussenegger/nvim-dap
    use "mfussenegger/nvim-dap"  -- dap client
    use "theHamsta/nvim-dap-virtual-text"
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use "nvim-telescope/telescope-dap.nvim"


    -- Telescope
    use "nvim-telescope/telescope.nvim"
    -- use "nvim-telescope/telescope-media-files.nvim"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use "p00f/nvim-ts-rainbow"
    -- use "nvim-treesitter/playground"

    -- Git
    use "lewis6991/gitsigns.nvim"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
