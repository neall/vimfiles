set nocompatible

call pathogen#infect()

syntax on

set backupdir=~/.vim/backup
set directory=~/.vim/tmp

nnoremap <silent> <leader>] :tabnext<cr>
nnoremap <D-9> :tabprev<cr>
nnoremap <silent> <leader>[ :tabprev<cr>
nnoremap <D-0> :tabnext<cr>

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
set guifont=Monaco:h24
" set guifont=Source\ Code\ Pro:h16

set viminfo=%,'50,<2000

set hlsearch
noh
set incsearch

set number
set scrolloff=1

" Don't double-space after sentences:
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
  colorscheme desert
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

vnoremap <leader><bar> :Tabularize /\|/<cr>
vnoremap <leader>> :Tabularize /=>/<cr>
vnoremap <leader>= :Tabularize /=/<cr>
vnoremap <leader>: :Tabularize /:\zs/<cr>
nnoremap <leader><leader> :b#<cr>
nnoremap <leader>gg :Ggrep -w <cr>

" lcd to the git root
nnoremap <silent> <leader>cd :Glcd<cr>
nnoremap <silent> <leader>d :colorscheme solarized<cr>:set background=dark<cr>
nnoremap <silent> <leader>l :colorscheme solarized<cr>:set background=light<cr>

nnoremap <silent> <leader>de :e %:h<cr>
nnoremap <silent> <leader>dv :vsp %:h<cr>
nnoremap <silent> <leader>ds :sp %:h<cr>
nnoremap <silent> <leader>dt :tabnew %:h<cr>

nnoremap <silent> <leader>pr Orequire 'pry'; binding.pry<esc>

" nnoremap <silent> <leader>t 0:put =strftime('%F')<cr>I# <esc>0
nnoremap <silent> <leader>t gg0I# <C-r>=strftime('%F')<cr><cr><cr>## yesterday<cr><cr>## today<cr><cr>## blockers<cr><cr><cr><esc>ggjj

nnoremap <silent> <leader>p :Prettier

nnoremap <silent> <leader>s :vsp<cr><C-w>h:A<cr>

autocmd! FileType cucumber
      \ if filereadable(expand('$HOME/vimfiles/scripts/tabularize-cuke-tables.vim'))
      \ | source $HOME/vimfiles/scripts/tabularize-cuke-tables.vim
      \ | endif

augroup Miscellaneous
  au!
  autocmd Filetype markdown setlocal textwidth=80 linebreak
  autocmd Filetype perl     setlocal shiftwidth=4 tabstop=4
  autocmd Filetype objc     setlocal shiftwidth=4 tabstop=4
  autocmd Filetype objcpp   setlocal shiftwidth=4 tabstop=4
  autocmd BufWritePre */nexia-js/*.js,*/nexia-js/*.jsx :Prettier
augroup END

augroup FiletypeDetection
  au!
  autocmd BufNewFile,BufReadPost *.tpl,*.tt setlocal filetype=tt2html
  autocmd BufNewFile,BufReadPost *.md setlocal filetype=markdown
  autocmd BufRead,BufNewFile *.hamlc set filetype=haml
augroup END

" vim: ft=vim
