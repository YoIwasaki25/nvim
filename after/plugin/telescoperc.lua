-- 'Telescope.nvim' -----------------------------------------------------------------------------------------------------------
vim.api.nvim_set_keymap("n", "<leader>k", "<Cmd>lua require('telescope.builtin').find_files()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>g", "<Cmd>lua require('telescope.builtin').live_grep()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>b", "<Cmd>lua require('telescope.builtin').buffers()<CR>", {noremap = true})

-- 'Telescope-frecency.nvim' -----------------------------------------------------------------------------------------------------------
vim.api.nvim_set_keymap("n", "<leader>o", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", {noremap = true, silent = true})

-- 'Telescope-file-browser.nvim' -----------------------------------------------------------------------------------------------------------
vim.api.nvim_set_keymap("n", "<leader>n", "<Cmd>Telescope file_browser<CR>", {noremap = true})
