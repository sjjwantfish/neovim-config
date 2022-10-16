-- setup mason and mason_lspconfig
require("user.lsp.mason")
require("user.lsp.handlers").setup()
-- setup null-ls
require("user.lsp.null-ls")
require("mason-null-ls").setup()



