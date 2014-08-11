" release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END


set nocompatible
filetype indent plugin on
syntax on

" Buffer command line completion
set hidden

" Show commands in the last line of the screen
set wildmenu

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Share the Clipboad
set clipboard+=unnamed

" Disable octal (influence <C-a>, <C-x>)
set nrformats-=octal

" Lean history lengh
set history=50

" Connection the Japanese, dosen't insert space
set formatoptions+=mM

" Using keyboard cursor key
set whichwrap=b,s,[,],<,>

" Enable free cursor in Visual mode
set virtualedit=block

" Backspace able to delete indent , eol, start
set backspace=indent,eol,start

" Enable using a mouse
if has('mouse')
  set mouse=a
endif




"------------------------------------------------
" Indent options
"   _           _
"  | |         | |             _
"  | |____   __| |_____ ____ _| |_
"  | |  _ \ / _  | ___ |  _ (_   _)
"  | | | | ( (_| | ____| | | || |_
"  |_|_| |_|\____|_____)_| |_| \__)

" Indentation space2 insted of tab
set shiftwidth=2
set softtabstop=2
set expandtab

"------------------------------------------------
" Mapping
"   _______                   _
"  (_______)                 (_)
"    _  _  _ _____ ____  ____  _ ____   ____
"   | ||_|| (____ |  _ \|  _ \| |  _ \ / _  |
"   | |   | / ___ | |_| | |_| | | | | ( (_| |
"   |_|   |_\_____|  __/|  __/|_|_| |_|\___ |
"                 |_|   |_|           (_____|
"

" Map Y to act like D and C
map Y y$

" Map <C-L> to turn off search highlight
nnoremap <C-L> :nohl<CR><C-L>


"------------------------------------------------
" Search
"      ______                        _
"     / _____)                      | |
"    ( (____  _____ _____  ____ ____| |__
"     \____ \| ___ (____ |/ ___) ___)  _ \
"     _____) ) ____/ ___ | |  ( (___| | | |
"    (______/|_____)_____|_|   \____)_| |_|
"

" Use case insentive serch
set ignorecase
set smartcase

" Return the first case
set wrapscan

" Using increment search
set incsearch

" Hightlight searches word
set hlsearch


"------------------------------------------------
" View
"    _     _ _
"   (_)   (_|_)
"    _     _ _ _____ _ _ _
"   | |   | | | ___ | | | |
"    \ \ / /| | ____| | | |
"     \___/ |_|_____)\___/
"

" Using visual bell insted of beep sound
set noerrorbells
set novisualbell
set visualbell t_vb=

" Display line numbers
set number

" show match brackets
set showmatch matchtime=1

" Auto Indent
set autoindent
set backspace=indent,eol,start

" C Indent
set cinoptions+=:0

" Show Title
set title

" Show command in status line
set showcmd

"Show last line
set display=lastline

" Show last space, Tab
set list
set listchars=tab:^\ ,trail:~

" Enable Highlight
if &t_Co > 2 || has('gui_running')
  syntax on
endif

" Comming from over editers would expect
set nostartofline

" Always display the status
set laststatus=2

" Enable use of mouse
set mouse=a

" Command line window height to 2 lines
set cmdheight=2

" テキストの折り返し
set wrap

" 自動的な改行を無効化
set textwidth=0
" 80文字目にラインを入れる
set colorcolumn=80

" Beauty char
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%

" ESCを２回押すとハイライトが消える
nmap <silent> <Esc><Esc> :nohlsearch<CR>


"------------------------------------------------
" Showing Char code and Hex code in end of line
"

if has('iconv')
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'').']['.&ff.']'}%=[0x%{FencB()}]\ (%v,%l)/%L%8P\ 

else
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'').']['.&ff.']'}5:5:5:5:5:%=\ (%v,%l)/%L%8P\ 

endif

function! FencB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return s:Byte2hex(s:Str2byte(c))
endfunction

function! s:Str2byte(str)
  return map(range(len(a:str)), 'char2nr(a:str[v:val])')
endfunction

function! s:Byte2hex(bytes)
  return join(map(copy(a:bytes), 'printf("%02X", v:val)'), '')
endfunction



"------------------------------------------------
" diff
"   ______  _    ___    ___
"  (______)(_)  / __)  / __)
"    _     _ _ _| |__ _| |__
"   | |   | | (_   __|_   __)
"   | |__/ /| | | |    | |
"   |_____/ |_| |_|    |_|
"

if has('win95') || has('win16') || has('win32') || has('win64')
  set diffexpr=MyDiff()
  function! MyDiff()
    silent! let saved_sxq=&shellxquote
    silent! set shellxquote=
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    " let cmd = '!diff ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
    let cmd = '!""' . $VIM . '\diff" ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . '"'
    silent exe cmd
    silent! let &shellxquote = saved_sxq
  endfunction
endif
"現バッファの差分表示(変更箇所の表示)
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
"ファイルまたはバッファ番号を指定して差分表示。#なら裏バッファと比較
command! -nargs=? -complete=file Diff if '<args>'=='' | browse vertical diffsplit|else| vertical diffsplit <args>|endif
"パッチコマンド
set patchexpr=MyPatch()
function! MyPatch()
   :call system($VIM."\\'.'patch -o " . v:fname_out . " " . v:fname_in . " < " . v:fname_diff)
endfunction



"------------------------------------------------
" Normal mode 
"

" Showing help file
nnoremap <F1> K

" Running Vim script
nnoremap <F8> :source %<CR>

" Disable force all save
nnoremap ZZ <Nop>

nnoremap <Down> gj
nnoremap <Up> gk
nnoremap h <Left>gk
nnoremap j gj
nnoremap k gk
nnoremap l <Right>zv

" 検索後に対象ワードを中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" w!! saving of Super user mode
cmap w!! w !sudo tee > /dev/null %

"------------------------------------------------
" Insert mode
"   _                                                 _
"  | |                         _                     | |
"  | |____   ___ _____  ____ _| |_    ____   ___   __| |_____
"  | |  _ \ /___) ___ |/ ___|_   _)  |    \ / _ \ / _  | ___ |
"  | | | | |___ | ____| |     | |_   | | | | |_| ( (_| | ____|
"  |_|_| |_(___/|_____)_|      \__)  |_|_|_|\___/ \____|_____)
"

" Replace the :  ;
nnoremap ; :
nnoremap : ;

" 素早く押すとESCとみなす
inoremap jj <Esc>



"------------------------------------------------
" Visual mode
"   _     _ _                  _                     _
"  (_)   (_|_)                | |                   | |
"   _     _ _  ___ _   _ _____| |    ____   ___   __| |_____
"  | |   | | |/___) | | (____ | |   |    \ / _ \ / _  | ___ |
"   \ \ / /| |___ | |_| / ___ | |   | | | | |_| ( (_| | ____|
"    \___/ |_(___/|____/\_____|\_)  |_|_|_|\___/ \____|_____)
"

"------------------------------------------------
" Commands mode
"    _______                                  _
"   (_______)                                | |
"    _       ___  ____  ____  _____ ____   __| | ___
"   | |     / _ \|    \|    \(____ |  _ \ / _  |/___)
"   | |____| |_| | | | | | | / ___ | | | ( (_| |___ |
"    \______)___/|_|_|_|_|_|_\_____|_| |_|\____(___/
"


"------------------------------------------------
" Vim Script
"   _     _ _           ______             _
"  (_)   (_|_)         / _____)           (_)       _
"   _     _ _ ____    ( (____   ____  ____ _ ____ _| |_
"  | |   | | |    \    \____ \ / ___)/ ___) |  _ (_   _)
"   \ \ / /| | | | |   _____) | (___| |   | | |_| || |_
"    \___/ |_|_|_|_|  (______/ \____)_|   |_|  __/  \__)
"                                               |_|
"

" Moving last Cursor When open the file
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END

" Changing Stasu line Color when Insert mode
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif
" if has('unix') && !has('gui_running')
"   " ESCでキー入力待ちになる対策
"   inoremap <silent> <ESC> <ESC>
" endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
    redraw
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

""""""""""""""""""""""""""""""
"全角スペースを表示
""""""""""""""""""""""""""""""
"コメント以外で全角スペースを指定しているので、scriptencodingと、
"このファイルのエンコードが一致するよう注意！
"強調表示されない場合、ここでscriptencodingを指定するとうまくいく事があります。
"scriptencoding cp932

"デフォルトのZenkakuSpaceを定義
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    " ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
    autocmd ColorScheme       * call ZenkakuSpace()
    " 全角スペースのハイライト指定
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif




"------------------------------------------------
" Plugin
"   ______  _              _
"  (_____ \| |            (_)
"   _____) ) | _   _  ____ _ ____
"  |  ____/| || | | |/ _  | |  _ \
"  | |     | || |_| ( (_| | | | | |
"  |_|      \_)____/ \___ |_|_| |_|
"                   (_____|



set nocompatible               " be iMproved
filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle/')) 
	set runtimepath+=$goroot/misc/vim
endif


" 非同期通信を可能にする
" 'build'が指定されているのでインストール時に自動的に
" 指定されたコマンドが実行され vimproc がコンパイルされる
NeoBundle "Shougo/vimproc", {
      \ "build": {
      \   "windows"   : "make -f make_mingw32.mak",
      \   "cygwin"    : "make -f make_cygwin.mak",
      \   "mac"       : "make -f make_mac.mak",
      \   "unix"      : "make -f make_unix.mak",
      \ }}

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-surround'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/Align'
NeoBundle 'vim-scripts/YankRing.vim'

"NeoBundle 'https://bitbucket.org/kovisoft/slimv'

" インストールされていないプラグインのチェックおよびダウンロード
NeoBundleCheck


filetype plugin indent on     " required!
filetype indent on
syntax on

" Unite.vim Config

" in start insert mode
let g:unite_enable_start_insert=1

" list of buffer
noremap <C-P> :Unite buffer<CR>

" file list
noremap <C-N> :Unite -buffer-name=file file<CR>

" using file list
noremap <C-Z> :Unite file_mru<CR>

imap <C-f> <C-x><C-o>

" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


" Vim tmplate Config

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


nnoremap <Leader>g :GundoToggle<CR>
nmap <Leader>T <plug>TaskList

" CoffeeScript config
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et


" Insertモードに入るまでロードしない

NeoBundleLazy 'Shougo/neosnippet.vim', {
    \ "autoload": {"insert": 1}}
" 'GundoToggle'が呼ばれるまでロードしない
NeoBundleLazy 'sjl/gundo.vim', {
    \ "autoload": {"commands": ["GundoToggle"]}}
" '<Plug>TaskList'というマッピングが呼ばれるまでロードしない
NeoBundleLazy 'vim-scripts/TaskList.vim', {
    \ "autoload": {"mappings": ['<Plug>TaskList']}}
" HTMLが開かれるまでロードしない
NeoBundleLazy 'mattn/zencoding-vim', {
    \ "autoload": {"filetypes": ['html']}}






NeoBundleLazy 'majutsushi/tagbar', {
      \ "autload": {
      \   "commands": ["TagbarToggle"],
      \ },
      \ "build": {
      \   "mac": "brew install ctags",
      \ }}
nmap <Leader>t :TagbarToggle<CR>


NeoBundle "thinca/vim-template"
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



NeoBundleLazy "Shougo/unite.vim", {
      \ "autoload": {
      \   "commands": ["Unite", "UniteWithBufferDir"]
      \ }}
NeoBundleLazy 'h1mesuke/unite-outline', {
      \ "autoload": {
      \   "unite_sources": ["outline"],
      \ }}
nnoremap [unite] <Nop>
nmap U [unite]
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]r :<C-u>Unite register<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]o :<C-u>Unite outline<CR>
nnoremap <silent> [unite]t :<C-u>Unite tab<CR>
nnoremap <silent> [unite]w :<C-u>Unite window<CR>
let s:hooks = neobundle#get_hooks("unite.vim")
function! s:hooks.on_source(bundle)
  " start unite in insert mode
  let g:unite_enable_start_insert = 1
  " use vimfiler to open directory
  call unite#custom_default_action("source/bookmark/directory", "vimfiler")
  call unite#custom_default_action("directory", "vimfiler")
  call unite#custom_default_action("directory_mru", "vimfiler")
  autocmd MyAutoCmd FileType unite call s:unite_settings()
  function! s:unite_settings()
    imap <buffer> <Esc><Esc> <Plug>(unite_exit)
    nmap <buffer> <Esc> <Plug>(unite_exit)
    nmap <buffer> <C-n> <Plug>(unite_select_next_line)
    nmap <buffer> <C-p> <Plug>(unite_select_previous_line)
  endfunction
endfunction


NeoBundleLazy "Shougo/vimfiler", {
      \ "depends": ["Shougo/unite.vim"],
      \ "autoload": {
      \   "commands": ["VimFilerTab", "VimFiler", "VimFilerExplorer"],
      \   "mappings": ['<Plug>(vimfiler_switch)'],
      \   "explorer": 1,
      \ }}
nnoremap <Leader>e :VimFilerExplorer<CR>
" close vimfiler automatically when there are only vimfiler open
autocmd MyAutoCmd BufEnter * if (winnr('$') == 1 && &filetype ==# 'vimfiler') | q | endif
let s:hooks = neobundle#get_hooks("vimfiler")
function! s:hooks.on_source(bundle)
  let g:vimfiler_as_default_explorer = 1
  let g:vimfiler_enable_auto_cd = 1
  
  " .から始まるファイルおよび.pycで終わるファイルを不可視パターンに
  " 2013-08-14 追記
  let g:vimfiler_ignore_pattern = "\%(^\..*\|\.pyc$\)"

  " vimfiler specific key mappings
  autocmd MyAutoCmd FileType vimfiler call s:vimfiler_settings()
  function! s:vimfiler_settings()
    " ^^ to go up
    nmap <buffer> ^^ <Plug>(vimfiler_switch_to_parent_directory)
    " use R to refresh
    nmap <buffer> R <Plug>(vimfiler_redraw_screen)
    " overwrite C-l
    nmap <buffer> <C-l> <C-w>l
  endfunction
endfunction




if has('lua') && v:version >= 703 && has('patch885')
    NeoBundleLazy "Shougo/neocomplete.vim", {
        \ "autoload": {
        \   "insert": 1,
        \ }}
    " 2013-07-03 14:30 NeoComplCacheに合わせた
    let g:neocomplete#enable_at_startup = 1
    let s:hooks = neobundle#get_hooks("neocomplete.vim")
    function! s:hooks.on_source(bundle)
        let g:acp_enableAtStartup = 0
        let g:neocomplet#enable_smart_case = 1
        " NeoCompleteを有効化
        " NeoCompleteEnable
    endfunction
else
    NeoBundleLazy "Shougo/neocomplcache.vim", {
        \ "autoload": {
        \   "insert": 1,
        \ }}
    " 2013-07-03 14:30 原因不明だがNeoComplCacheEnableコマンドが見つからないので変更
    let g:neocomplcache_enable_at_startup = 1
    let s:hooks = neobundle#get_hooks("neocomplcache.vim")
    function! s:hooks.on_source(bundle)
        let g:acp_enableAtStartup = 0
        let g:neocomplcache_enable_smart_case = 1
        " NeoComplCacheを有効化
        " NeoComplCacheEnable 
    endfunction
endif


NeoBundleLazy "Shougo/neosnippet.vim", {
      \ "depends": ["honza/vim-snippets"],
      \ "autoload": {
      \   "insert": 1,
      \ }}
let s:hooks = neobundle#get_hooks("neosnippet.vim")
function! s:hooks.on_source(bundle)
  " Plugin key-mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)
  " SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"
  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif
  " Enable snipMate compatibility feature.
  let g:neosnippet#enable_snipmate_compatibility = 1
  " Tell Neosnippet about the other snippets
  let g:neosnippet#snippets_directory=s:bundle_root . '/vim-snippets/snippets'
endfunction


" let g:indent_guides_enable_on_vim_startup = 1 2013-06-24 10:00 削除
let s:hooks = neobundle#get_hooks("vim-indent-guides")
function! s:hooks.on_source(bundle)
  let g:indent_guides_guide_size = 1
  IndentGuidesEnable " 2013-06-24 10:00 追記
endfunction

NeoBundleLazy "vim-scripts/TaskList.vim", {
      \ "autoload": {
      \   "mappings": ['<Plug>TaskList'],
      \}}
nmap <Leader>T <plug>TaskList


NeoBundle "scrooloose/syntastic", {
      \ "build": {
      \   "mac": ["pip install flake8", "npm -g install coffeelint"],
      \   "unix": ["pip install flake8", "npm -g install coffeelint"],
      \ }}




























