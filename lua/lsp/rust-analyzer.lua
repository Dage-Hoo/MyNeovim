local gset = require("lsp.global_lsp_settings")
require("rust-tools").setup({
    server = {
        on_attach = gset.on_attach,
        flags = gset.lsp_flags,
    },

})
