set nocompatible

call pathogen#infect()

syntax on

set backupdir=~/.vim/backup
set directory=~/.vim/tmp

filetype plugin indent on
set ff=unix

set nocindent
set smartindent
set autoindent
set expandtab
set shiftwidth=2
set tabstop=2

set hidden
set autoread
set autowriteall

set viminfo=%,'50,<2000

set hlsearch
set incsearch

set number
set scrolloff=1

set spell
set spellsuggest=best,10

set wildmenu

set background=dark
colorscheme solarized

" requires vim-fugitive:
set statusline=%f%m\ %y%=%l,%c\ %P\ %{fugitive#statusline()}
set laststatus=2

augroup Miscellaneous
  au!
  autocmd Filetype markdown setlocal textwidth=78
augroup END

" vim: ft=vim
