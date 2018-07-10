if has('vim_starting')
	set nocompatible               " Be iMproved

	" Required:
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
" Required: 
NeoBundleFetch 'Shougo/neobundle.vim'

" statements over this line are OMAJINAI 
" Color Schemes!
NeoBundle 'tomasr/molokai'

" Improve programing language environment
NeoBundle 'vim-scripts/Vim-R-plugin'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'vim-scripts/matlab.vim'
" Bundle 'vim-scripts/octave.vim'
" Bundle 'vim-scripts/maxima.vim'
NeoBundle 'OMNeTpp4.x-NED-Syntax-file'
NeoBundle 'NesC-Syntax-Highlighting'
NeoBundle 'lervag/vimtex'
NeoBundle 'mitechie/pyflakes-pathogen'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'itchyny/dictionary.vim'
NeoBundle 'modsound/macdict-vim'

" vim-matchit: '%' function for if/endif
NeoBundle 'kana/vim-submode'
NeoBundle 'jwhitley/vim-matchit'
NeoBundle 'surround.vim'
" NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'jalvesaq/VimCom'
" Bundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-template'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'kmdsbng/vim-ruby-eval'
" NeoBundle 'alpaca-tc/alpaca_tags'
"
if has("lua")
	  NeoBundleLazy 'Shougo/neocomplete', { 'autoload' : {
		        \   'insert' : 1,
		        \ }}
endif
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/neomru.vim'

NeoBundle 'Emmet.vim'
NeoBundle 'ervandew/screen'
NeoBundle 'gtags.vim'
NeoBundle 'nvie/vim-flake8'
NeoBundle 'vim-ruby/vim-ruby'
" vim-scripts repos
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
NeoBundle 'sudo.vim'
NeoBundle 'hybrid.vim'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'davidhalter/jedi-vim'
" non github repos
" Bundle 'git://github.com/tyru/eskk.vim.git'
" Bundle 'git://github.com/tyru/skkdict.vim.git'
call neobundle#end()	

filetype plugin indent on     " required! 

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Encoding & ff
set encoding=utf-8
set ff=unix

" Folding Setting
" set foldmethod=manual
"
" Automatically change current dir
" set autochdir

" No Backup Files
set noswapfile
set nobackup

" Displaying Line Number
" set number
set relativenumber

"syntax highlight
syntax on

colorscheme molokai

" jj to Esq
inoremap jj <Esc>

" Space Wide
setlocal expandtab
set ts=2 sw=2 sts=2 tw=0

" カーソルを見失わないようにする
" set cursorcolumn
set cursorline

" let g:ScreenImpl = 'Tmux'
set t_Co=256

" release autogroup in MyAutoCmd
augroup MyAutoCmd
	autocmd!
augroup END

" テンプレート中に含まれる特定文字列を置き換える
autocmd MyAutoCmd User plugin-template-loaded call s:template_keywords()
function! s:template_keywords()
	silent! %s/<+DATE+>/\=strftime('%Y-%m-%d')/g
	silent! %s/<+FILENAME+>/\=expand('%:r')/g
endfunction
" テンプレート中に含まれる'<+CURSOR+>'にカーソルを移動
autocmd MyAutoCmd User plugin-template-loaded
			\   if search('<+CURSOR+>')
			\ |   silent! execute 'normal! "_da>'
			\ | endif

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" easymotion
map <Leader> <Plug>(easymotion-prefix)
" nmap s <Plug>(easymotion-s2)
" nmap t <Plug>(easymotion-t2)

" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1

if has('kaoriya')
	set guioptions-=T
	set showtabline=2
	set imdisable
	set transparency=0
	set antialias
	set guifont=SourceCodePro-Light:h18
	" set fuoptions=maxvert,maxhorz
	" au GUIEnter * set fullscreen
endif

" NERDCommenter
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" VimShell
" ,is: シェルを起動
nnoremap <silent> ,is :VimShell<CR>
" ,ipy: pythonを非同期で起動
nnoremap <silent> ,ipy :VimShellInteractive python<CR>
" ,irb: irbを非同期で起動
nnoremap <silent> ,irb :VimShellInteractive irb<CR>
" ,ss: 非同期で開いたインタプリタに現在の行を評価させる
vmap <silent> ,ss :VimShellSendString<CR>
" 選択中に,ss: 非同期で開いたインタプリタに選択行を評価させる
nnoremap <silent> ,ss <S-v>:VimShellSendString<CR>

" Quickrun with asynchronous execution
let g:quickrun_config = {
			\   '*': {'runmode': 'async:remote:vimproc'},
			\ }

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
      \ },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

      " \ 'separator': { 'left': '⮀', 'right': '⮂' },
set laststatus=2

" unite.vim
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_limit = 200
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <Leader>f [unite]
 
" file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''

"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>

function! s:unite_my_settings()
    "ESCでuniteを終了
    nmap <buffer> <ESC> <Plug>(unite_exit)
    "入力モードのときjjでノーマルモードに移動
    imap <buffer> jj <Plug>(unite_insert_leave)
    "入力モードのときctrl+wでバックスラッシュも削除
    imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
    "sでsplit
    nnoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
    inoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
    "vでsplit
    nnoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
    inoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
    "fでvimfiler
    nnoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
    inoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
  endfunction

  "}}}

  "vimfiler {{{

  "vimデフォルトのエクスプローラをvimfilerで置き換える
  let g:vimfiler_as_default_explorer = 1
  "セーフモードを無効にした状態で起動する
  let g:vimfiler_safe_mode_by_default = 0
	" 開いたファイルの場所にcdする
	let g:vimfiler_enable_auto_cd = 1
  "現在開いているバッファのディレクトリを開く
  nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>
  "現在開いているバッファをIDE風に開く
  nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

  "デフォルトのキーマッピングを変更
  augroup vimrc
    autocmd FileType vimfiler call s:vimfiler_my_settings()
  augroup END
  function! s:vimfiler_my_settings()
    nmap <buffer> q <Plug>(vimfiler_exit)
    nmap <buffer> Q <Plug>(vimfiler_hide)
  endfunction

"画面分割，タブページに関するもの(http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca) 
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')
  "}}}
