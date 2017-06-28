
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
  Plug 'sonph/onehalf', {'rtp': 'vim/'}
  Plug 'editorconfig/editorconfig-vim'
  Plug 'shougo/neocomplete.vim'

  " Syntax
  Plug 'sheerun/vim-polyglot'
  Plug 'hashivim/vim-terraform'

  " Interface
  Plug 'mhinz/vim-startify'
  Plug 'itchyny/lightline.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree'

  " Editing
  Plug 'tpope/vim-commentary'
  Plug 'terryma/vim-expand-region'

  " Language specific plugins
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

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

" Use the system clipboard.
set clipboard=unnamed

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
colorscheme onehalfdark

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
let g:lightline = { 'colorscheme': 'onehalfdark' }

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

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_cast = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

" vim-go
let g:go_bin_path = expand("~/Code/go/bin")
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)
au FileType go nmap <leader>gd <Plug>(go-doc-vertical)
au FileType go nmap <leader>gdb <Plug>(go-doc-browser)
au FileType go nmap <leader>gi <Plug>(go-implements)
au FileType go nmap <leader>ga :GoAlternate<CR>
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Startify
" Close NERDTree before saving sessions.
let g:startify_session_before_save = [
	\ 'echo "Cleaning up before saving session..."',
	\ 'silent! NERDTreeClose'
	\ ]
" Automatically update sessions when vim is closed or a new session is loaded.
let g:Startify_session_persistence = 1
" Automatically cd to vcs root when opening a file from the startify menu.
let g:startify_change_to_vcs_root = 1
" Set the startify header
let g:startify_custom_header = [
	\ '               _             ',
	\ '      __   __ (_)  _ __ ___  ',
	\ '      \ \ / / | | | `_ ` _ \ ',
	\ '       \ V /  | | | | | | | |',
	\ '        \_/   |_| |_| |_| |_|',
	\]

" Set the order of the startify sections
let g:startify_list_order = [
	\['   Sessions:'],
	\'sessions',
	\['   Bookmarks:'],
	\'bookmarks',
	\['   MRU in dir:'],
	\'dir',
	\'commands',
	\]

" Set up some bookmarks for configs.
let g:startify_bookmarks = [
	\{ 'v': '~/.vimrc' },
	\{ 'vl': '~/.vimrc.local' },
	\{ 'g': '~/.gitconfig' },
	\]

" Set some nice session management keymappings.
nmap <leader>ss :SSave<CR>
nmap <leader>sc :SClose<CR>

""""""""""""""""""""""""
" Drupal
""""""""""""""""""""""""
if has("autocmd")
  augroup module
    autocmd BufRead,BufNewFile *.{module,install,test,inc,profile} set filetype=php
    autocmd BufRead,BufNewFile *.{info,make,build} set filetype=dosini
  augroup END
endif




""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""
" Taken from github.com/spf13/spf13-vim
function! InitializeDirectories()
	let parent = $HOME
	let prefix = 'vim'
	let dir_list = {
		    \ 'backup': 'backupdir',
		    \ 'views': 'viewdir',
		    \ 'swap': 'directory' }

	if has('persistent_undo')
	    let dir_list['undo'] = 'undodir'
	endif

	let common_dir = parent . '/.' . prefix . '/'

	for [dirname, settingname] in items(dir_list)
	    let directory = common_dir . dirname . '/'
	    if exists("*mkdir")
		if !isdirectory(directory)
		    call mkdir(directory)
		endif
	    endif
	    if !isdirectory(directory)
		echo "Warning: Unable to create backup directory: " . directory
		echo "Try: mkdir -p " . directory
	    else
		let directory = substitute(directory, " ", "\\\\ ", "g")
		exec "set " . settingname . "=" . directory
	    endif
	endfor
endfunction
call InitializeDirectories()

""""""""""""""""""""""""
" Local configuration
""""""""""""""""""""""""
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
