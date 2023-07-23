vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.whichwrap = "b,s,[,],<,>"
vim.opt.backspace = "indent,eol,start"
vim.opt.ambiwidth = "single"
vim.opt.wildmenu = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.hlsearch = true
vim.opt.hidden = true
vim.opt.winblend = 20
vim.opt.pumblend = 20
vim.opt.termguicolors = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.nrformats = "bin,hex"
vim.opt.swapfile = false
vim.opt.clipboard:append { 'unnamedplus' }
vim.opt.completeopt = "menu,menuone,noinsert"
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

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('macos')
end
if is_win then
  require('windows')
end


vim.cmd 'autocmd ColorScheme * highlight Normal ctermbg=none guibg=none'
vim.cmd 'autocmd ColorScheme * highlight NonText ctermbg=none guibg=none'
vim.cmd 'autocmd ColorScheme * highlight LineNr ctermbg=none guibg=none'
vim.cmd 'autocmd ColorScheme * highlight Folded ctermbg=none guibg=none'
vim.cmd 'autocmd ColorScheme * highlight EndOfBuffer ctermbg=none guibg=none'
vim.cmd 'colorscheme Terafox'
