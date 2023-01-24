local gset = require("lsp.global_lsp_settings")
require("lspconfig")["cmake"].setup({
    cmd = { "/home/dage/.local/share/nvim/mason/bin/cmake-language-server" },
    on_attach = gset.on_attach,
    flags = gset.lsp_flags,
})
