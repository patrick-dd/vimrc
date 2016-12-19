"
" patrick's vimrc
" tweet me your opinion about how i'm doing this wrong: @patrickdoupe
"

set nocompatible
filetype plugin on
syntax on

" open with NERDTree
au VimEnter * NERDTree
"" enable line numbers
let NERDTreeShowLineNumbers=1
"" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" set the runtime path to include vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'scrooloose/nerdtree'
Plugin 'bronson/vim-visual-star-search'
Plugin 'vimwiki/vimwiki'
" Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

syntax enable
set background=dark

set laststatus=2
let g:notes_directories=['~/Dropbox/notes']
let g:notes_suffix='*.txt'
let g:tex_flavor='latex'
let g:vimwiki_list=[{'path': '~/Dropbox/vimwiki', 'index' : 'index'}]

" settings
set number
syntax on
set textwidth=78
set wrap

"" Python things
" mappingsnding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
" automatically check for tabs on reading python
" au BufRead *.py :normal gg=G

" automatic comments by filetype
autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
autocmd FileType latex nnoremap <buffer> <leader>c I%<esc>

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line with new line

" setting the status line
set statusline=%f
set statusline+=\ -\
set statusline+=FileType:
set statusline+=%y
set statusline+=%=
set statusline+=%4l
set statusline+=/
set statusline+=%-4L

" make backspaces more powerfull
set backspace=indent,eol,start

set ruler               " show line and column number
set showcmd             " show (partial) command in status line

" colours
" colo monokai
syntax on               " syntax highlighting
set t_Co=256 	        " setting to 256 color mode

inoremap jk <esc>
let mapleader = ","
noremap - ddp
noremap _ ddkkp
nnoremap <leader>d ddi
nnoremap <leader>c ddi<Return><esc>ki
inoremap <c-u> <esc>Ui
nnoremap <c-u> <esc>U

nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap H 0
nnoremap L $
vnoremap H 0
vnoremap L $

" making it easy to edit the .vimrc
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>


" abbreviation
:iabbrev @@ patrick.doupe@mssm.edu
:iabbrev ssig -- <cr>Patrick Doupe<cr>Senior Data Analyst<cr>Arnhold Institute for Global Health<cr>patrick.doupe@mssm.edu
:iabbrev teh the
:iabbrev adn and
:iabbrev THe The
:iabbrev deffn def ():<cr><Tab>"""<cr>Describe what this function does<cr><cr>Inputs:<cr><cr>Output:<cr><cr>"""<cr><cr>return<cr>

" Diff Options
"
"
"" Display filler
set diffopt=filler

" Open diff in horizontal buffer
set diffopt+=horizontal
"
" " Ignore changes in whitespaces characters
set diffopt+=iwhite
