""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" A vimrc file
"
" Maintainer: Patrick Doupe
"
" Sections:
"   basic
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle

set nocompatible
filetype on

" set the runtime path to include vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'scrooloose/nerdtree'
Plugin 'bronson/vim-visual-star-search'
Plugin 'vimwiki/vimwiki'
Plugin 'mattn/calendar-vim'
Plugin 'dense-analysis/ale'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'majutsushi/tagbar'
Plugin 'derekwyatt/vim-scala'
Plugin 'jpalardy/vim-slime'

call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""
" General

" highlighted syntax
syntax on

" show command you're typing
set showcmd

" change map leader to comma
let mapleader = ","

" there is no escape button on a post 2017 MPB
inoremap jk <esc>

" spaces rather than tabs
set expandtab
set smarttab

" set tabs to 2
set shiftwidth=2
set softtabstop=2
" unless python
au BufRead,BufNewFile,BufReadPre  *.py setlocal shiftwidth=4
au BufRead,BufNewFile,BufReadPre  *.py setlocal softtabstop=4

" line numbers
set relativenumber 

" keep files sane
set textwidth=78
set wrap

" nicer on the eyes
set background=dark

" netrw configuration
let g:netrw_banner = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd tree

" toggle NERDTree on/off
map <C-n> :NERDTreeToggle<CR>
" close vim when the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" last window has a status line
" set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""
" filetypes

"" unlimited tw for csvs, md and wiki files
au BufRead,BufNewFile,BufReadPre  *.csv setlocal tw=0
au BufRead,BufNewFile,BufReadPre  *.md setlocal tw=78
au BufRead,BufNewFile,BufReadPre  *.wiki setlocal tw=78
au BufRead,BufNewFile,BufReadPre  *.Rmd setlocal tw=80

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
set statusline+=Column:\ %-6c
set statusline+=Row:\ %-6l
set statusline+=Total:\ %-4L

" make backspaces more powerfull
set backspace=indent,eol,start

set ruler               " show line and column number
set showcmd             " show (partial) command in status line

syntax on               " syntax highlighting
set t_Co=256 	        " setting to 256 color mode

nnoremap <leader>d ddi
nnoremap <leader>c ddi<Return><esc>ki
inoremap <c-u> <esc>Ui
nnoremap <c-u> <esc>U
"inoremap dx <C-R>=strftime('%d%m%Y')
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap H 0
nnoremap L $
vnoremap H 0
vnoremap L $

" omnicomplete
set omnifunc=syntaxcomplete#Complete

" toggle pastemode
nnoremap <leader>pp :set paste
nnoremap <leader>np :set nopaste
" making it easy to edit the .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>hv :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" abbreviation
iabbrev teh the
iabbrev adn and
iabbrev THe The

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


"""""""""""""""""""""""""""""""""""""""""""""""""""
" vimwiki

" vim wiki and vim notes
let g:notes_directories=['~/nfs/vimwiki/notes']
let g:notes_suffix='*.txt'
let g:tex_flavor='latex'
" vimwiki
let g:vimwiki_list = [
                        \{'path': '~/nfs/vimwiki/zalando.wiki'},
                        \{'path': '~/nfs/vimwiki/personal.wiki'}
                \]
au BufRead,BufNewFile *.wiki set filetype=vimwiki

" calendar
nnoremap <leader>cl :CalendarVR <CR> <bar> :vertical resize +4 <CR> <bar>

" weeks begin on a monday
let g:calendar_monday = 1
" have calendar weeks
let g:calendar_weeknm=3


let g:nested_syntaxes={'python': 'python', 'sql': 'sql', 'scala': 'scala'}
" let g:vimwiki_url_maxsave=0

" syntastic
" by default this is off

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
" hit ctrl-w E for error checking
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_sql_checkers=['sqlint']
let g:syntastic_python_checkers=['mypy','flake8']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "regex": [
        \ '\mpossible unwanted space at "{"',
        \ ] }
let g:syntastic_python_python_exec = '/Users/pdoupe/.pyenv/shims/python'

" LaTeX (rubber) macro for compiling
nnoremap <leader>c :w<CR>:!rubber -pdf --clean --warn all %<CR>

" View PDF macro; ':%r' is current file's root (base) name
nnoremap <leader>v :!skim %:r.pdf &<CR><CR>

" For SirVer/ultisnips
" Trigger configuration
" let g:UltisnipsExpandTrigger="<tab>"
" let g:UltisnipsJumpForwardTrigger="<c-b>"
" let g:UltisnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window
" let g:UltiSnipsEditSplit="vertical"

" make vim use decimals with leading zeros 
set nrformats-=octal

" for plugin Tagbar
nnoremap <leader>tt :TagbarToggle<CR>
" for plugin NERDTree
nnoremap <leader>nt :NERDTreeToggle<CR>
" to find the current file
nnoremap <leader>ntf :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F6>"
let g:NERDTreeMapPreview="<F5>"
