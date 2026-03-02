" set distinction the char code
set encoding=utf-8
" set file return code
set fileformats=unix,dos,mac


" release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END


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
set history=200

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

" Indentation space2 insted of tab
set shiftwidth=2
set softtabstop=2
set expandtab

" Auto Indent
set autoindent

" C Indent
set cinoptions+=:0


"------------------------------------------------
" Search

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

" Using visual bell insted of beep sound
set noerrorbells
set novisualbell
set visualbell t_vb=

" Display line numbers
set number

" show match brackets
set showmatch matchtime=1

" Show Title
set title

" Show command in status line
set showcmd

"Show last line
set display=lastline

" Comming from over editers would expect
set nostartofline

" Always display the status
set laststatus=2

" Command line window height to 2 lines
set cmdheight=2

" テキストの折り返し
set wrap

" 自動的な改行を無効化
set textwidth=0
" 80文字目にラインを入れる
set colorcolumn=80

" Show last space, Tab
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%

" ESCを２回押すとハイライトが消える
nmap <silent> <Esc><Esc> :nohlsearch<CR>


"------------------------------------------------
" Mapping

" Map Y to act like D and C
map Y y$

" Replace the :  ;
nnoremap ; :
nnoremap : ;

" 素早く押すとESCとみなす
inoremap jj <Esc>

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
" Vim Script

" Moving last Cursor When open the file
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END

""""""""""""""""""""""""""""""
"全角スペースを表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif


"------------------------------------------------
" diff

"現バッファの差分表示(変更箇所の表示)
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
"ファイルまたはバッファ番号を指定して差分表示。#なら裏バッファと比較
command! -nargs=? -complete=file Diff if '<args>'=='' | browse vertical diffsplit|else| vertical diffsplit <args>|endif


"------------------------------------------------
" Plugin

call plug#begin('~/.vim/plugged')

" テキスト囲み操作
Plug 'tpope/vim-surround'
" 自動 end 挿入
Plug 'tpope/vim-endwise'
" コメントトグル
Plug 'tomtom/tcomment_vim'
" HTML/CSS 展開
Plug 'mattn/emmet-vim'
" ファイルツリー
Plug 'preservim/nerdtree'
" ステータスライン
Plug 'itchyny/lightline.vim'
" 非同期リント
Plug 'dense-analysis/ale'
" 軽量非同期補完
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
" Undo ツリー
Plug 'mbbill/undotree'
" テキスト整列
Plug 'junegunn/vim-easy-align'

call plug#end()


"------------------------------------------------
" Plugin settings

" lightline
let g:lightline = { 'colorscheme': 'default' }
set noshowmode

" ALE
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

" asyncomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>
autocmd BufEnter * if (winnr('$') == 1 && &filetype ==# 'nerdtree') | q | endif

" undotree
nnoremap <Leader>u :UndotreeToggle<CR>

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
