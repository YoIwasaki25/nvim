" Vim基本設定 {{{
" 行番号の表示
set number
set relativenumber
" 現在の列を強調表示
set cursorline
" 入力中のコマンドをステータスに表示する
set showcmd
" 行末の一文字先までカーソルを移動できるように
set virtualedit=onemore

" シンタクスハイライトの有効化
syntax enable

" インクリメンタルサーチ.　1文字入力ごとに検索を行う
set incsearch
" 検索パターンに大文字小文字を区別しない
set ignorecase
" 検索パターンに大文字を含んでいたら大文字小文字を区別する set smartcase 検索結果をハイライト
set hlsearch
" タブ入力を複数の空白入力に置き換える set expandtab 画面上でタブ文字が占める幅
set tabstop=4
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4
" 開業時に前の行のインデントを継続する
set autoindent
" 改行時に前の行の構文をチェックし次の行のインデントを増減する
set smartindent
" smartindent で増減する幅
set shiftwidth=4
" コマンドモードの補完
set wildmenu 
" 保存するコマンド履歴の数
set history=5000
"bro olの設定
set viminfo='20
" 補完時の挙動
set completeopt=menuone,noinsert

set clipboard=unnamedplus

set statusline^=%{coc#status()}

au Filetype vim setlocal foldmethod=marker
au Filetype text setlocal foldmethod=marker

" set syntax=markdown
" au BufRead,BufNewFile *.md set filetype=markdown
" }}}

" Keybind 変更 {{{
noremap ; :
noremap : ;

inoremap <silent> jj <ESC>
nnoremap <S-h> ^
nnoremap <S-l> $
nnoremap <space>n :NERDTree<CR>
nnoremap <CR> A<CR><ESC>

nnoremap ` gt
nnoremap <space>`  gT

nnoremap <Tab><Tab> <C-w>w
nnoremap <Tab>l <C-w>l
nnoremap <Tab>k <C-w>k
nnoremap <Tab>j <C-w>j
nnoremap <Tab>h <C-w>h
nnoremap  <space>f  <C-z>

tnoremap <silent>jj <C-\><C-n>


let mapleader = "\<space>"
" nnoremap <leader>fr :FlutterRun<cr>
" nnoremap <leader>fq :FlutterQuit<cr>
" nnoremap <leader>fhr :FlutterHotReload<cr>
" nnoremap <leader>frs :FlutterHotRestart<cr>
" " python Fixの実行
" nnoremap <leader>fi :ALEFix<cr>

" nnoremap <leader>s :Semicolon<cr>

for i in range(1, 9)
    execute 'nnoremap <Tab>' . i . ' ' . i . 'gt'
endfor

"asyncompleteのポップアップにTABを使う
inoremap <expr><C-n> pumvisible() ? "\<Down>" : "\<C-n>"
inoremap <expr><C-p> pumvisible() ? "\<Up>" : "\<C-p>"
inoremap <expr><Tab> pumvisible() ? "\<Down>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<Up>" : "\<S-Tab>"
inoremap <expr><CR>  pumvisible() ? "\<C-y>" : "\<CR>"
" suggest
inoremap <silent><expr> ;;  coc#refresh()
"スペース2回でCocList
nnoremap  <leader>coc :CocList<cr>
nnoremap  <leader>cod :CocDiagnostic<cr>
"スペースhでHover
nnoremap  <leader>ho :call CocAction('doHover')<cr>
"スペースdfでDefinition
nnoremap  <leader>df <Plug>(coc-definition)
"スペースrfでReferences
nnoremap  <leader>rf <Plug>(coc-references)
"スペースrnでRename
nnoremap  <leader>rn :call CocAction('rename')<cr>
"スペースfmtでFormat
nnoremap  <leader>fmt :call CocAction('format')<cr>
"エラーへジャンプ
nnoremap  <leader>] :call CocAction('diagnosticNext')<cr>
nnoremap  <leader>[ :call CocAction('diagnosticPrevious')<cr>

" ESCしたときに、自動でIMEをOFFにする
function! ImInActivate()
  call system('fcitx-remote -c')
endfunction
inoremap <silent> <C-[> <ESC>:call ImInActivate()<CR>

nnoremap <leader>mp :MarkdownPreview <CR>
nnoremap <leader>mps :MarkdownPreviewStop <CR>
nnoremap <leader>mpt :MarkdownPreviewToggle <CR>
"}}}

"dein setting{{{

if &compatible
	set nocompatible			   " Be iMproved
endif

" Required:
set runtimepath+=/Users/typezeroshare/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/typezeroshare/.cache/dein')
	call dein#begin('/Users/typezeroshare/.cache/dein')

	" Let dein manage dein
	" Required:
	call dein#add('/Users/typezeroshare/.cache/dein/repos/github.com/Shougo/dein.vim')

	" Add or remove your plugins here like this:
	let s:toml_dir = expand('/Users/typezeroshare/.config/nvim/rc/')  
	call dein#load_toml(s:toml_dir . '/dein.toml',{'lazy':0})
	call dein#load_toml(s:toml_dir . '/dein_lazy.toml',{'lazy':1})
	call dein#end()
	call dein#save_state()
endif

" Required:
filetype plugin indent on
filetype plugin on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif
"}}}

"plugins setting {{{
" +color scheme {{{
colorscheme iceberg
set background=dark
set termguicolors

highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

" +}}}
" +vim-air-line {{{
" Powerline系フォントを利用する
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
" let g:airline#extensions#coc#enabled = 1
" let g:airline#extensions#coc#error_symbol = 'Error'
" let g:airline#extensions#coc#warning_symbol = 'Warning'
" let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
" let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

let g:airline_theme = 'nightfly'
let g:airline_solarized_bg='dark'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#ale#enabled = 1
let g:ale_disable_lsp = 0

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
"+}}}
" +vim-lang設定 {{{
let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++1z -stdlib=libc++ -pedantic-errors'
""let g:clang_format_auto = 1
let g:clang_format_style = 'Google'
let g:clang_check_syntax_auto = 1
" +}}}
" +rainbow {{{
let g:rainbow_active = 1
" +}}}
" +vim-indent-guides {{{
" Vim 起動時 vim-indent-guides を自動起動
let g:indent_guides_enable_on_vim_startup=0
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=1
" 自動カラー無効
let g:indent_guides_auto_colors=0
" 奇数番目のインデントの色
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#efed9a ctermfg = 228
" 偶数番目のインデントの色
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#000000 ctermbg = 1
hi IndentGuidesOdd  guibg=red   ctermbg=9
hi IndentGuidesEven guibg=green ctermbg=23
"ガイドの幅 
let g:indent_guides_guide_size = 1
" +}}}
" +mycmd {{{
" 文末にセミコロンをつける自作プラグイン
":source ~/.vim/mycmd/semicolon.vim
" +}}}
" +Twitvim {{{
let twitvim_browser_cmd = 'open' " for Mac
let twitvim_force_ssl = 1
let twitvim_count = 40
"+ }}}
" +dart-vim-plugin {{{
let g:dart_style_guide = 4
" +}}}
" +coc.nvim {{{
function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction

let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#warning_symbol = 'W:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
" +}}}
" +denite.nvim{{{
let s:denite_win_width_percent = 0.85
let s:denite_win_height_percent = 0.7

let g:unite_source_file_mru_limit = 30

" Change denite default options
call denite#custom#option('default', {
    \ 'split': 'floating',
    \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
    \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
    \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
    \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
	\})
set pumblend=50 " 0 〜 100 が指定できます。ドキュメントによると 5 〜 30 くらいが適当だそうです。
autocmd FileType denite set winblend=50
autocmd FileType denite-filter set winblend=50

nnoremap [denite] <Nop>
nmap <leader>d [denite]
nnoremap <silent> [denite]g :<C-u>Denite grep -buffer-name=search-buffer-denite<CR>
nnoremap <silent> [denite]r :<C-u>Denite -resume -buffer-name=search-buffer-denite<CR>
nnoremap <silent> [denite]f :<C-u>Denite file/rec<CR>
nnoremap <silent> [denite]b :<C-u>Denite file/old<CR>
" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction
"}}}
" +markdown-preview.nvim{{{
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_browser = ''
"+}}}
" +other setting {{{

"シンタックスのグループ名を知る関数
function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid) else return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()

" pyenvを用いたpythonのパス指定
" let g:python_host_prog = $HOME/.anyenv/envs/pyenv/versions/neovim3/bin/python
let g:python3_host_prog = "$HOME/.anyenv/envs/pyenv/versions/neovim3/bin/python"

" ;Cheatでvimのチートシートを見ることができる
let g:cheatsheet#cheat_file ='/Users/typezeroshare/memo/vim.md'

" +}}}
" +calendar.vim {{{
"
" API認証情報の格納パス $HOME/.cache/calendar.vim/credentials.vim
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
source $HOME/.cache/calendar.vim/credentials.vim

" }}}
" +nvim-treesitter {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
highlight = {
enable = true,
disable = {
'lua',
'ruby',
'c_charp',
'vue'
}
},
ensure_installed = 'maintained',
}
EOF
" }}}
"}}}
