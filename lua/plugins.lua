local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
    install_path })
end

vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'luochen1990/rainbow'
  use 'EdenEast/nightfox.nvim'
  use 'simeji/winresizer'
  use 'kylechui/nvim-surround'
  use 'tpope/vim-commentary'
  use 'norcalli/nvim-colorizer.lua'
  use 'akinsho/bufferline.nvim'
  --coc.nvim の <CR>と競合する
  use {
    'windwp/nvim-autopairs',
    config = function() require("nvim-autopairs").setup {} end
  }
  use 'windwp/nvim-ts-autotag'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use {
    'nvim-telescope/telescope-frecency.nvim',
    config = function()
      require "telescope".load_extension("frecency")
    end,
    requires = { "tami5/sqlite.lua" }
  }
  use {
    'nvim-telescope/telescope-file-browser.nvim',
    config = function()
      require "telescope".load_extension("file_browser")
    end,
  }
  -- use {
  --     'neoclide/coc.nvim',
  --     branch = 'release'
  -- }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- 'LSP'--
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'glepnir/lspsaga.nvim'
  use 'akinsho/toggleterm.nvim'

  -- 'Completion'--
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'onsails/lspkind-nvim'
  use 'L3MON4D3/LuaSnip'

  use 'lewis6991/gitsigns.nvim'
  use 'folke/zen-mode.nvim'

  -- 'prettier' --
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'

  -- 'chatGPT' --
  use({
    'jackMort/ChatGPT.nvim',
    config = function()
      require('chatgpt').setup({

      })
    end,
    requires = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    }
  })

  -- 'Comment.nvim' --
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- 'todotxt.nvim' --
  use {
    'arnarg/todotxt.nvim',
    requires = { 'MunifTanjim/nui.nvim' },
  }

  -- install without yarn or npm
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  })

  if packer_bootstrap then
    require("packer").sync()
  end
end
)

vim.cmd([[autocmd BufWritePost init.lua source <afile> | PackerCompile]])
