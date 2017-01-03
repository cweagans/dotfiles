
" Automatically install vim-plug if it's not present.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Automatically install missing plugins on startup.
autocmd VimEnter *
  \  if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall | q
  \| endif

" Set up plugins
call plug#begin("~/.vim/plugged")

  " General
  Plug 'tpope/vim-sensible'
  Plug 'jacoborus/tender.vim'
  Plug 'editorconfig/editorconfig-vim'

  " Syntax
  Plug 'sheerun/vim-polyglot'
  Plug 'hashivim/vim-terraform'
  Plug 'chase/vim-ansible-yaml'

  " Interface
  Plug 'mhinz/vim-startify'
  Plug 'itchyny/lightline.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree'

  " Editing
  Plug 'tpope/vim-commentary'
  Plug 'terryma/vim-expand-region'

call plug#end()


"""""""""""""""""""""""
" General
"""""""""""""""""""""""
" Set the leader to ,
let mapleader = ","

" Set the encoding to UTF-8.
set encoding=utf-8

" Use two lines for status.
set laststatus=2

" Enable mouse support.
set mouse=a

" Allow cursor positioning one character past the end of the line.
set virtualedit=onemore

" Highlight the cursor line.
set cursorline

" Show what mode vim is in.
set showmode

" Set the length of the vim command history.
set history=1000

" Allow buffer switching without saving.
set hidden

" Allow backspacing through indents, eol, and start of insert.
set backspace=indent,eol,start

" Enable incremental search.
set incsearch

" Highlight search results.
set hlsearch

" Enable case insensitive search.
set ignorecase

" Don't do things I didn't ask for...
set nowrap

" ...but indent my shit intelligently.
set autoindent

" Window split behaviors
set splitright  " vsplit opens new window to the right
set splitbelow  " split opens new window below

" Show matching brackets/parens
set showmatch

" Show list of possible completions instead of just completing.
set wildmenu

" Show problematic whitespace
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Draw a vertical ruler for formatting assistance.
set colorcolumn=80

" Undo behaviors
if has('persistent_undo')
  set undofile
  set undolevels=1000
  set undoreload=10000
endif


"""""""""""""""""""""""
" Appearance
"""""""""""""""""""""""
" Turn on syntax highlighting.
syntax enable

" Set the colorscheme.
colorscheme tender

" Turn on line nubering.
set number

" Colors
if (has('termguicolors'))
  set termguicolors
endif

" GUI configuration.
if (has('gui_running'))
  " Increase line spacing in the GUI.
  set linespace=10

  " Hide all the gui components
  set guioptions=

  " Macvim
  if (has('gui_macvim'))
    " Disable the print shortcut because nobody prints their fucking code.
    macm File.Print key=<nop>
  endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings (core vim - no plugin mappings)
"""""""""""""""""""""""""""""""""""""""""""""""
" Yank from the cursor to the end of the line to be consistent with C and D.
nnoremap Y y$

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Disable ex mode.
nnoremap Q <nop>

" Clear searches on ESC.
nnoremap <esc> :let @/ = ""<return><esc>
nnoremap <esc>^[ <esc>^[


""""""""""""""""""""""""
" Plugin configuration
""""""""""""""""""""""""
" Lightline
let g:lightline = { 'colorscheme': 'tender' }

" CtrlP
let g:ctrlp_by_filename = 1

" Commentary
nmap <leader>/ :Commentary<CR>
vmap <leader>/ :Commentary<CR>

" Vim expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" NERDTree
map <leader>1 :NERDTreeToggle<CR>

""""""""""""""""""""""""
" Local configuration
""""""""""""""""""""""""
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
