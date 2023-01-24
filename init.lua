-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require('basic')
require('plugins')
vim.cmd([[colorscheme zephyr]])
require('plugin-config.nvim-tree')
require('plugin-config.bufferline')
-- require('plugin-config/coc')
require('plugin-config.nvim-treesitter')
require('plugin-config.lualine')
require('plugin-config.indentline')
require('plugin-config.mason')
require('plugin-config.toggleterm')
require('plugin-config.navic')
require('plugin-config.win-bar')
require('plugin-config.nvim-dap')
require('lsp')
require('keybindings')

