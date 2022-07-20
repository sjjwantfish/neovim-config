local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("sjjwantfish.lsp.config")
require("sjjwantfish.lsp.fidget")
-- require("sjjwantfish.lsp.lsp-installer")
require("sjjwantfish.lsp.handlers").setup()
require("sjjwantfish.lsp.null-ls")
