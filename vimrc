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

set guioptions=gm
set guifont=Monaco:h14

set viminfo=%,'50,<2000

set hlsearch
noh
set incsearch

set number
set scrolloff=1

set nojoinspaces

set spell
set spellsuggest=best,10

set wildmenu
set wildmode=longest:full
set wildignore+=node_modules/**

if has("gui_running")
  set background=dark
  colorscheme solarized
else
  colorscheme elflord
endif

" requires vim-fugitive:
set statusline=%f%m\ %y%=%l,%c\ %P\ %{fugitive#statusline()}
set laststatus=2

let mapleader = " "

let g:ctrlp_open_multiple_files = 't'
let g:ctrlp_switch_buffer = 'eT'

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
" nnoremap <silent> <leader>h :call InsertHistory()<cr>

" edit this file's directory
nnoremap <silent> <leader>e. :e %:h<cr>

" delete current buffer
nnoremap <silent> <leader>dd :bd<cr>

" edit vimrc
nnoremap <silent> <leader>ev :tabnew $MYVIMRC<cr>
" source vimrc
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>

" cuke split:
nmap <silent> <leader>cs :only<cr>:sp<cr><c-]>zz
" cuke vertsplit:
nmap <silent> <leader>cv :only<cr>:vs<cr><c-]>zz

nnoremap <leader><bar> :Tabularize /\|/<cr>
nnoremap <leader>> :Tabularize /=>/<cr>
nnoremap <leader>= :Tabularize /=/<cr>
nnoremap <leader>: :Tabularize /:\zs/<cr>
nnoremap <leader><leader> :b#<cr>

" lcd to the git root
nnoremap <silent> <leader>cd :Glcd<cr>
nnoremap <silent> <leader>d :colorscheme solarized<cr>:set background=dark<cr>
nnoremap <silent> <leader>l :colorscheme solarized<cr>:set background=light<cr>

nnoremap <silent> <leader>pr Orequire 'pry'; binding.pry<esc>

" test snippets
nnoremap <silent> <leader>tg oGiven { false }<esc>b
nnoremap <silent> <leader>tG oGiven(:subject) { false }<esc>b
nnoremap <silent> <leader>tw oWhen { false }<esc>b
nnoremap <silent> <leader>tW oWhen(:result) { false }<esc>b
nnoremap <silent> <leader>tt oThen { false }<esc>b
nnoremap <silent> <leader>tT oAnd  { false }<esc>b
nnoremap <silent> <leader>td odescribe 'xxxxxxxxx' do<cr>end<esc>k$bbb

autocmd! FileType cucumber
      \ if filereadable(expand('$HOME/vimfiles/scripts/tabularize-cuke-tables.vim'))
      \ | source $HOME/vimfiles/scripts/tabularize-cuke-tables.vim
      \ | endif

" nnoremap <silent> <leader>j :tabnext<cr>
" nnoremap <silent> <leader>l :tabnext<cr>
" nnoremap <silent> <leader>k :tabprev<cr>
" nnoremap <silent> <leader>h :tabprev<cr>

nnoremap <silent> <leader>n :tabnext<cr>

augroup Miscellaneous
  au!
  " autocmd Filetype markdown setlocal textwidth=78 shiftwidth=4 tabstop=4
  autocmd Filetype markdown setlocal shiftwidth=4 tabstop=4
  autocmd Filetype perl     setlocal shiftwidth=4 tabstop=4
augroup END

augroup FiletypeDetection
  au!
  autocmd BufNewFile,BufReadPost *.tpl,*.tt setlocal filetype=tt2html
  autocmd BufNewFile,BufReadPost *.md setlocal filetype=markdown
  autocmd BufRead,BufNewFile *.hamlc set filetype=haml
augroup END

" vim: ft=vim
