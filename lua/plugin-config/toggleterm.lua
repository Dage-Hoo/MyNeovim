require("toggleterm").setup({
    open_mapping = [[<C-\>]],
    start_in_insert = true,
    direction = "horizontal",
    vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true}),
})
