vim.cmd [[
augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end
-- 设置窗口弹出方式安装插件;浮动显示
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Zephyr theme
    use 'glepnir/zephyr-nvim'
    -- Nvim-tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = 'nvim-tree/nvim-web-devicons',
        tag = 'nightly'
    }
    -- Bufferline
    use { 'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons' }
    -- use { 'neoclide/coc.nvim', branch = 'release' }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use "lukas-reineke/indent-blankline.nvim"
    use { "akinsho/toggleterm.nvim", tag = '*' }
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp'
    }
    use { 'SirVer/ultisnips',
        requires = { { 'honza/vim-snippets', rtp = '.' } },
        config = function()
            vim.g.UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
            vim.g.UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_jump_forward)"
            vim.g.UltiSnipsJumpBackwardTrigger = "<Plug>(ultisnips_jump_backward)"
            vim.g.UltiSnipsListSnippets = "<c-x><c-s>"
            vim.g.UltiSnipsRemoveSelectModeMappings = 0
        end
    }
    use "quangnguyen30192/cmp-nvim-ultisnips"
    use 'fgheng/winbar.nvim'
    use {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig"
    }
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use { 'jose-elias-alvarez/null-ls.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use 'simrat39/rust-tools.nvim'
end)
