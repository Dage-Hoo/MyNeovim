local gset = require("lsp.global_lsp_settings")
require('lspconfig')['lua_ls'].setup({
    on_attach = gset.on_attach,
    flags = gset.lsp_flags,
    settings = {
        Lua = {
            runtime = {versio = 'LuaJIT'},
            diagnostics = { globals = {'vim'},},
            workspace = {library = vim.api.nvim_get_runtime_file("", true),},
            telemetry = {enable = false,},
        }
    }
})
