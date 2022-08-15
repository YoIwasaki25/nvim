local status, toggleterm = pcall(require, "toggleterm")
if (not status) then return end

local Terminal = require "toggleterm.terminal".Terminal
local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true, direction = 'float' })
function _lazygit_toggle()
  lazygit:toggle()
end

toggleterm.setup {
  open_mapping = [[<leader>t]],
  insert_mappings = false,
  direction = 'float',
  close_on_exit = true,
}

vim.api.nvim_set_keymap("n", "<leader>lg", "<Cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
