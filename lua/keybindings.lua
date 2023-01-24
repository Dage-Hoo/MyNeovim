local dapui = require('dapui')
local dap = require('dap')
vim.g.mapleader = ","
vim.g.maplocalleader = ","
local map = vim.keymap.set
local opt = { noremap = true, silent = true }
-- 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
map("n", "sc", "<C-w>c", opt) -- close current window
map("n", "so", "<C-w>o", opt) -- close others
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
map("n", "<A-Up>", "<C-w>k", opt)
map("n", "<A-Down>", "<C-w>j", opt)
map("n", "<A-Left>", "<C-w>h", opt)
map("n", "<A-Right>", "<C-w>l", opt)

map('n', '<A-m>', '<cmd>NvimTreeToggle<CR>', opt)
-- bufferline 左右Tab切换
map("n", "<C-h>", "<cmd>BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", "<cmd>BufferLineCycleNext<CR>", opt)
map("n", "<C-Left>", "<cmd>BufferLineCyclePrev<CR>", opt)
map("n", "<C-Right>", "<cmd>BufferLineCycleNext<CR>", opt)
map("n", "<leader>f", "<Plug>(coc-format-selected)", opt)
map("v", "<leader>f", "<Plug>(coc-format-selected)", opt)
map("n", "<leader>q", "<cmd>bp | bd #<CR>", opt) -- close current buffer
map("n", "<space>e", vim.diagnostic.open_float, opt)
map("n", "[d", vim.diagnostic.goto_prev, opt)
map("n", "]d", vim.diagnostic.goto_next, opt)
map("n", "<space>q", vim.diagnostic.setloclist, opt)
