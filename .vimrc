"
" patrick's vimrc
" tweet me your opinion about how i'm doing this wrong: @patrickdoupe
"

set nocompatible
filetype plugin on
syntax on

" open with NERDTree
" au VimEnter * NERDTree
" toggle NERDTree on/off
map <C-n> :NERDTreeToggle<CR>
" close vim when the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
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
Plugin 'vim-syntastic/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-commentary'
" Plugin '/usr/local/opt/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'majutsushi/tagbar'

call vundle#end()
filetype plugin indent on

syntax enable
set background=dark

set laststatus=2



" settings
set number
syntax on
set textwidth=78
set wrap

"" unlimited tw for csvs and markdowns
au BufRead,BufNewFile,BufReadPre  *.csv setlocal tw=0
au BufRead,BufNewFile,BufReadPre  *.md setlocal tw=0
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
set statusline+=Column:\ %-6c
set statusline+=Row:\ %-6l
set statusline+=Total:\ %-4L

" make backspaces more powerfull
set backspace=indent,eol,start

set ruler               " show line and column number
set showcmd             " show (partial) command in status line

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
:nnoremap <leader>pp :set paste
:nnoremap <leader>np :set nopaste
" making it easy to edit the .vimrc
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>


" abbreviation
:iabbrev @@ mail@patrickdoupe.net
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

" vim wiki and vim notes
let g:notes_directories=['~/Dropbox/notes']
let g:notes_suffix='*.txt'
let g:tex_flavor='latex'
let g:vimwiki_list=[{'path': '~/Dropbox/vimwiki', 'index' : 'index'}]
" let g:vimwiki_url_maxsave=0

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" LaTeX (rubber) macro for compiling
nnoremap <leader>c :w<CR>:!rubber -pdf --clean --warn all %<CR>

" View PDF macro; ':%r' is current file's root (base) name
nnoremap <leader>v :!skim %:r.pdf &<CR><CR>

" For SirVer/ultisnips
" Trigger configuration
let g:UltisnipsExpandTrigger="<tab>"
let g:UltisnipsJumpForwardTrigger="<c-b>"
let g:UltisnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window
" let g:UltiSnipsEditSplit="vertical"

" make vim use decimals with leading zeros 
set nrformats-=octal

" for plugin Tagbar
nmap <F8> :TagbarToggle<CR>
" for plugin NERDTree
nmap <F7> :NERDTree<CR>
