-- 'base settings' -----------------------------------------------------------------------------------------------------------
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.whichwrap = "b,s,[,],<,>"
vim.opt.backspace = "indent,eol,start"
vim.opt.ambiwidth = "single"
vim.opt.wildmenu = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.hlsearch = true
vim.opt.hidden = true
vim.opt.winblend = 20
vim.opt.pumblend = 20
vim.opt.termguicolors = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.nrformats = "bin,hex"
vim.opt.swapfile = false
vim.opt.clipboard:append{'unnamedplus'}
vim.opt.completeopt="menuone,noselect"
vim.opt.ttyfast = true
vim.opt.history = 100
vim.cmd 'autocmd TermOpen * startinsert'
vim.cmd [[ 
if executable('fcitx5')
  let g:fcitx_state = 1
  autogroup fcitx_savestate autocmd!
  autocmd InsertLeave * let g:fcitx_state = str2nr(system('fcitx5-remote'))
  autocmd InsertLeave * call system('fcitx5-remote -c')
  autocmd InsertEnter * call system(g:fcitx_state == 1 ? 'fcitx5-remote -c': 'fcitx5-remote -o') augroup END endif 
]]

-- 'colorscheme' ----------------------------------------------------------------------------------------------------------------
vim.cmd 'autocmd ColorScheme * highlight Normal ctermbg=none guibg=none'
vim.cmd 'autocmd ColorScheme * highlight NonText ctermbg=none guibg=none'
vim.cmd 'autocmd ColorScheme * highlight LineNr ctermbg=none guibg=none'
vim.cmd 'autocmd ColorScheme * highlight Folded ctermbg=none guibg=none'
vim.cmd 'autocmd ColorScheme * highlight EndOfBuffer ctermbg=none guibg=none'
vim.cmd 'colorscheme nightfox'

-- 'keyconfig' ----------------------------------------------------------------------------------------------------------------
vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', ';', ':', {noremap = true})
vim.api.nvim_set_keymap('n', ':', ';', {noremap = true})
vim.api.nvim_set_keymap('n', '<Tab><Tab>', '<C-w>w', {noremap = true})

-- 'packer.nvim' --------------------------------------------------------------------------------------------------------------
require'plugins'
vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]

-- 'lualine.nvim' --------------------------------------------------------------------------------------------------------------
require('lualine').setup{
  options = { theme = 'horizon' }
}

-- 'indent-blankline.nvim' -----------------------------------------------------------------------------------------------------------
vim.opt.list = true
require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}

-- 'coc.nvim' -----------------------------------------------------------------------------------------------------------------
-- coc.nvim 0.0.82 から、pop up の仕様変更があったみたい。
-- pumvisible() が利かなくなり、coc#pum#visible() に変更したところ治った
vim.api.nvim_set_keymap("i", "<CR>", "coc#pum#visible() ? coc#pum#confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'", {silent = true, expr = true, noremap = true})
vim.api.nvim_set_keymap("i", ";;", "coc#refresh()", { silent = true, expr = true })
vim.api.nvim_set_keymap("n", "gd","<Plug>(coc-definition)", {silent = true})
vim.api.nvim_set_keymap("n", "<leader>rn","<Plug>(coc-rename)", {silent = true})
vim.api.nvim_set_keymap("n", "K","<Cmd>call CocActionAsync('doHover')<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>f","<Cmd>CocCommand prettier.formatFile<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<leader>[","<Cmd>call CocAction('diagnosticPrevious')<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<leader>]","<Cmd>call CocAction('diagnosticNext')<CR>", { noremap = true})
vim.o.updatetime = 300

-- 'Telescope.nvim' -----------------------------------------------------------------------------------------------------------
vim.api.nvim_set_keymap("n", "<C-k>", "<Cmd>lua require('telescope.builtin').find_files()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-g>", "<Cmd>lua require('telescope.builtin').live_grep()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>b", "<Cmd>lua require('telescope.builtin').buffers()<CR>", {noremap = true})

-- 'Telescope-frecency.nvim' -----------------------------------------------------------------------------------------------------------
vim.api.nvim_set_keymap("n", "<leader>o", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", {noremap = true, silent = true})

-- 'Telescope-file-browser.nvim' -----------------------------------------------------------------------------------------------------------
vim.api.nvim_set_keymap("n", "<leader>n", "<Cmd>Telescope file_browser<CR>", {noremap = true})
