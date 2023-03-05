require("mason").setup({
    ui = {
        height = 0.8,
        width = 60,
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup({
    ensure_installed = { "pyright", "lua_ls" }
})
