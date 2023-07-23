local status, saga = pcall(require, "lspsaga")
if (not status) then
end

saga.setup {
    server_filetype_map = {
        typescript = 'typescript'
    }
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-k>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
vim.keymap.set('n', '<space>rn', '<Cmd>Lspsaga rename<CR>', opts)
-- vim.keymap.set('n', "<leader>t", '<Cmd>Lspsaga open_floaterm<CR>', opts)
-- vim.keymap.set('t', "<leader>t", '<C-\\><C-n><Cmd>Lspsaga close_floaterm<CR>', opts)
