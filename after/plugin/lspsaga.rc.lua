local status, saga = pcall(require, "lspsaga")
if (not status) then
end

saga.setup {
  server_filetype_map = {
    typescript = 'typescript'
  },
  lightbulb = {
    enable = false,
  },
  outline = {
    win_position = 'right',
    layout = 'float'
  }
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-k>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga goto_definition<CR>', opts)
vim.keymap.set('n', '<leader>lf', '<Cmd>Lspsaga finder<CR>', opts)
vim.keymap.set('n', '<leader>rn', '<Cmd>Lspsaga rename<CR>', opts)
vim.keymap.set('n', '<leader>d', '<Cmd>Lspsaga show_buf_diagnostics<CR>', opts)
vim.keymap.set('n', '<leader>lo', '<Cmd>Lspsaga outline<CR>', opts)
