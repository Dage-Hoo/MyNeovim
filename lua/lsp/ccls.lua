local gset = require("lsp.global_lsp_settings")
require("lspconfig")["ccls"].setup({
    on_attach = gset.on_attach,
    flags = gset.lsp_flags,
    init_options = {
        compilationDatabaseDirectory = "build",
        index = {
            threads = 0,
        },
        clang = {
            excludeArgs = { "-frounding-math" },
        },
    },
})
