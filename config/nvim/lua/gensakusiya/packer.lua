-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself

    use 'wbthomason/packer.nvim'

    -- for bettrer file navigation

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- colors scheme

    use {
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    }

    -- for ast

    use {
        'nvim-treesitter/nvim-treesitter',
        { run = ':TSUpdate' }
    }

    use 'nvim-treesitter/playground'

    -- file navigation and more othen usages

    use 'nvim-lua/plenary.nvim'
    use 'theprimeagen/harpoon'

    -- undo tree plugin

    use 'mbbill/undotree'

    -- got git integration

    use 'tpope/vim-fugitive'

    -- lsp server and deps

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = ':MasonUpdate'
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    use 'jose-elias-alvarez/typescript.nvim'

    use 'jose-elias-alvarez/null-ls.nvim'
    use 'MunifTanjim/prettier.nvim'

    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

    -- line UI
    use 'nvim-tree/nvim-web-devicons'
    use {
        'nvim-lualine/lualine.nvim',
    }

    -- file tree
    use 'prichrd/netrw.nvim'
end)
