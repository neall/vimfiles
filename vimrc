set nocompatible

call pathogen#infect()

syntax on

set backupdir=~/.vim/backup
set directory=~/.vim/tmp

nnoremap <D-9> :tabprev<cr>
nnoremap <D-0> :tabnext<cr>

" inoremap <Tab> <C-p>

set ignorecase
set smartcase

set showcmd
set lazyredraw
set splitright
set splitbelow

filetype plugin indent on
set ff=unix

set nocindent
set smartindent
set autoindent
set expandtab
set shiftwidth=2
set tabstop=2

set history=40

set hidden
set autoread
set autowriteall

set viminfo=%,'50,<2000

set hlsearch
noh
set incsearch

set number
set scrolloff=1

set spell
set spellsuggest=best,10

set wildmenu
set wildmode=longest:full

set background=dark
colorscheme solarized

" requires vim-fugitive:
set statusline=%f%m\ %y%=%l,%c\ %P\ %{fugitive#statusline()}
set laststatus=2

let mapleader = " "

let g:ctrlp_open_multiple_files = 't'

function! InsertMatchingLines()
  silent! redir => matching_lines
  silent! g//#
  silent! redir END
  silent! put =matching_lines
endf
nnoremap <silent> <leader>gm :call InsertMatchingLines()<cr>

function! InsertHistory()
  silent! redir => history_to_insert
  silent! history
  silent! redir END
  silent! put =history_to_insert
  silent! normal o
endf
nnoremap <silent> <leader>h :call InsertHistory()<cr>

nnoremap <silent> <leader>ev :tabnew ~/.vim/vimrc<cr>:Glcd<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>
nnoremap <silent> <leader>cd :Glcd<cr>
nnoremap <silent> <leader>d :set background=dark<cr>
nnoremap <silent> <leader>l :set background=light<cr>

nnoremap <silent> <leader>x :execute getline(".")<cr>

augroup Miscellaneous
  au!
  autocmd Filetype markdown setlocal textwidth=78 shiftwidth=4 tabstop=4
  autocmd Filetype perl     setlocal shiftwidth=4 tabstop=4
augroup END

augroup FiletypeDetection
  au!
  autocmd BufNewFile,BufReadPost *.tpl,*.tt setlocal filetype=tt2html
  autocmd BufNewFile,BufReadPost *.md setlocal filetype=markdown
augroup END

" vim: ft=vim
