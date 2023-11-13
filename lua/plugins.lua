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
  use {
    'shaunsingh/nord.nvim',
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = true
      vim.g.nord_disable_background = true
      vim.g.nord_italic = true
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = true

      require('nord').set()
    end,
  }
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
    requires = { "kkharji/sqlite.lua" }
  }
  use {
    'nvim-telescope/telescope-file-browser.nvim',
    config = function()
      require "telescope".load_extension("file_browser")
    end,
  }
  use { 'nvim-telescope/telescope-ui-select.nvim' }
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

    use {
      'lukas-reineke/headlines.nvim',
      after = 'nvim-treesitter',
    } }

  -- 'LSP'--
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'glepnir/lspsaga.nvim'
  use 'akinsho/toggleterm.nvim'
  use {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    config = function()
      require("fidget").setup {}
    end,
  }

  -- 'Completion'--
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'onsails/lspkind-nvim'
  use 'L3MON4D3/LuaSnip'

  use 'lewis6991/gitsigns.nvim'
  use 'folke/zen-mode.nvim'

  -- 'prettier' --
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'

  -- 'chatGPT' --
  -- use({
  --     'jackMort/ChatGPT.nvim',
  --     config = function()
  --         require('chatgpt').setup({

  --         })
  --     end,
  --     requires = {
  --         'MunifTanjim/nui.nvim',
  --         'nvim-lua/plenary.nvim',
  --         'nvim-telescope/telescope.nvim',
  --     }
  -- })

  -- 'Comment.nvim' --
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- 'todotxt.nvim' --
  -- use {
  --     'arnarg/todotxt.nvim',
  --     requires = { 'MunifTanjim/nui.nvim' },
  -- }

  -- install without yarn or npm
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  })

  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end
  }
  use({
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require('copilot').setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 10,
          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-{>",
            dismiss = "<C-]>",
            suggestion = "<M-s>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 16.x
        server_opts_overrides = {},
      })
    end
  })

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  }

  if packer_bootstrap then
    require("packer").sync()
  end
end
)

vim.cmd([[autocmd BufWritePost init.lua source <afile> | PackerCompile]])
