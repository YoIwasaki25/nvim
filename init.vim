" 行番号の表示
set number
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
" 検索パターンに大文字を含んでいたら大文字小文字を区別する
set smartcase
" 検索結果をハイライト
set hlsearch
" タブ入力を複数の空白入力に置き換える
set expandtab
" 画面上でタブ文字が占める幅
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

set clipboard+=unnamed
set clipboard=unnamed

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
for i in range(1, 9)
    execute 'nnoremap <Tab>' . i . ' ' . i . 'gt'
endfor

"========================================="
" plugin Manager: dein.vim setting
"========================================="
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/yo/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/yo/.cache/dein')
  call dein#begin('/Users/yo/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/yo/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  let s:toml_dir = expand('/Users/yo/.config/nvim/rc/')  
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

"========================================="
" setting
"=======================================

let g:solarized_termcolors=256
let g:solarized_temtrans = 1
colorscheme iceberg
set background=dark
set termguicolors

" vim-air-line設定
" Powerline系フォントを利用する
set laststatus=2

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_theme = 'nightfly'
let g:airline_solarized_bg='dark'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

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
"シンタックスのグループ名を知る関数------------------------------
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
" ------------------------------------------------------


" vim-lang設定---------------------------------------------------------
let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++1z -stdlib=libc++ -pedantic-errors'
""let g:clang_format_auto = 1
let g:clang_format_style = 'Google'
let g:clang_check_syntax_auto = 1
"-----------------------------------------------------------------------

" rainbow
let g:rainbow_active = 1

" vim-indent-guides
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

" 文末にセミコロンをつける自作プラグイン
:source ~/.vim/mycmd/semicolon.vim

" Twitvim
let twitvim_browser_cmd = 'open' " for Mac
let twitvim_force_ssl = 1
let twitvim_count = 40

"Omnisharp用にpython
let g:python3_host_prog = '/Users/yo/opt/anaconda3/bin/python3'
let g:python_host_prog = '/usr/local/bin/python2'

let g:OmniSharp_server_type = 'roslyn'
let g:OmniSharp_server_path = '/Users/yo/.cache/omnisharp-mono/OmniSharp.exe'
let g:OmniSharp_server_use_mono = 1

let g:asyncomplete_auto_popup =1
