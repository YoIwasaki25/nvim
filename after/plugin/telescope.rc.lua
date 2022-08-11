local status, telescope = pcall(require, "telescope")
if (not status) then return end

-- local function telescope_buffer_dir()
--   return vim.fn.expand('%:p:h')
-- end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = require('telescope.actions').close
      }
    },
    file_ignore_patterns = {
      "%.git/", "node_modules/.*", ".DS_Store"
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      hijack_netrw = true,
      mappings = {
        ["n"] = {
          ["/"] = function()
            vim.cmd('startinsert')
          end
        }
      },
    },
    frecency = {
      ignore_patterns = { "*.git/*", "*/tmp/*", "*.DS_Store*" },
    }
  }
}

telescope.load_extension("file_browser")

vim.keymap.set("n", "<leader>n", function()
  telescope.extensions.file_browser.file_browser({
    -- path = "%:p:h",
    -- cwd = telescope_buffer_dir(),
    respect_gitignore = true,
    hidden = true,
    grouped = true,
    initial_mode = "normal",
    layout_config = { height = 30 }
  })
end)

vim.keymap.set('n', '<leader>f', function()
  require('telescope.builtin').find_files({
    no_ignore = false,
    hidden = true
  })
end)

vim.keymap.set('n', "<leader>g", function()
  require('telescope.builtin').live_grep()
end)

vim.keymap.set('n', "<leader>b", function()
  require('telescope.builtin').buffers()
end)

-- 'Telescope-frecency.nvim' -----------------------------------------------------------------------------------------------------------
vim.api.nvim_set_keymap("n", "<leader><leader>", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>",
  { noremap = true, silent = true })
