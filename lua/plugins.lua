vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'jiangmiao/auto-pairs'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'cocopon/iceberg.vim'
    use 'luochen1990/rainbow'
    use 'EdenEast/nightfox.nvim'
    use 'simeji/winresizer'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use {
        'nvim-telescope/telescope.nvim', tag='0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'neoclide/coc.nvim',
        branch = 'release'
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt=true }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
end)
