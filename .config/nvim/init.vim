
" Automatically install vim-plug if it's not present.
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Automatically install missing plugins on startup.
autocmd VimEnter *
			\  if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
			\|   PlugInstall | q
			\| endif

" Set up plugins
call plug#begin("~/.config/nvim/plugged")

" General
Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
Plug 'editorconfig/editorconfig-vim'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'hashivim/vim-terraform'
Plug 'stephpy/vim-yaml'
Plug 'kylef/apiblueprint.vim'

" Interface
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'

" Editing
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-expand-region'
Plug 'Townk/vim-autoclose'

" Language specific plugins
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Other stuff
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'  

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

" Lines to scroll when the cursor leaves the screen.
set scrolljump=5

" Minimum visible lines to keep above or below the cursor.
set scrolloff=3


"""""""""""""""""""""""
" Appearance
"""""""""""""""""""""""
" Turn on syntax highlighting.
syntax enable

" Set the colorscheme.
colorscheme gruvbox
set bg=dark

" Turn on line nubering.
set number

" Colors
if (has('termguicolors'))
	set termguicolors
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

" For wrapped lines, j and k should navigate between rows, rather than lines.
nnoremap j gj
nnoremap k gk

" Clear searches on ESC.
nnoremap <esc> :let @/ = ""<return><esc>
nnoremap <esc>^[ <esc>^[

" Navigate splits with Ctrl + h,j,k,l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""""""""""""""""""""""""
" Plugin configuration
""""""""""""""""""""""""
" Lightline
let g:lightline = { 'colorscheme': 'gruvbox' }

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

" Deoplete
let g:deoplete#enable_at_startup = 1

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

" phpcomplete
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" automatically strip trailing whitespace
autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml,sql autocmd BufWritePre <buffer> call StripTrailingWhitespace()

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
			\{ 'v': '~/.config/nvim/init.vim' },
			\{ 'vl': '~/.config/nvim/ginit.vim' },
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
	let prefix = 'config/nvim'
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

function! StripTrailingWhitespace()
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" do the business:
	%s/\s\+$//e
	" clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction

""""""""""""""""""""""""
" Local configuration
""""""""""""""""""""""""
if filereadable(expand("~/.config/nvim/init.local.nvim"))
	source ~/.config/nvim/init.local.nvim
endif


