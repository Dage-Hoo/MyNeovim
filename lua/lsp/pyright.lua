local gset = require("lsp.global_lsp_settings")
require("lspconfig")["pyright"].setup({
    on_attach = gset.on_attach,
    flags = gset.lsp_flags,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "off",
            }
        }
    }
})
