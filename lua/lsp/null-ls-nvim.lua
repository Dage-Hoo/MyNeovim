local null_ls = require("null-ls")

local sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.completion.spell,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.rustfmt,
}
null_ls.setup({
    sources = sources,
    on_attach = function(client)
        if client.server_capabilities.document_formatting then
            vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
        end
    end,
})
