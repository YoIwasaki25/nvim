vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'cocopon/iceberg.vim'
    use 'luochen1990/rainbow'
    use 'EdenEast/nightfox.nvim'
    use 'simeji/winresizer'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'norcalli/nvim-colorizer.lua'
    use {
      'windwp/nvim-autopairs',
      config = function() require("nvim-autopairs").setup{} end
    }
    use {
        'nvim-telescope/telescope.nvim', tag='0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'nvim-telescope/telescope-frecency.nvim',
        config = function()
            require"telescope".load_extension("frecency")
        end,
        requires = {"tami5/sqlite.lua"}
    }
    use {
        'nvim-telescope/telescope-file-browser.nvim',
        config = function ()
            require"telescope".load_extension("file_browser")
        end,
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
