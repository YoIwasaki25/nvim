vim.g.mapleader = ";"
-- vim.api.nvim_set_keymap('n', ';', ':', {noremap = true})
-- vim.api.nvim_set_keymap('n', ':', ';', {noremap = true})
--
vim.api.nvim_set_keymap('n', '<leader>lr', '<Cmd>LspRestart<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-f>', '<Right>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-b>', '<Left>', { noremap = true })
