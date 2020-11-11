"
" My vim configuration
"
" This file contains the complete configuration for my daily driver vim
" configuration. It may or may not be useful for you as it's heavily tailored
" to how I want my vim to work.
"

" We need a plugin manager to be able to do anything as vim starts up,
" so we'll make sure we have one available here.
if !filereadable(stdpath('config') . "/autoload/plug.vim")
	let s:plug_path = stdpath('config') . "/autoload/plug.vim"
	execute "silent !curl -fLo " . s:plug_path . " --create-dirs " .
		\ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
endif

" Define plugins.
call plug#begin(stdpath('config') . '/plugins')
	" Defaults
	Plug 'editorconfig/editorconfig-vim'
	Plug 'tyru/caw.vim'

	" UI
	Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'vim-airline/vim-airline'
	Plug 'kshenoy/vim-signature'
	Plug 'junegunn/fzf', {'do': './install --bin'}
	Plug 'junegunn/fzf.vim'
	Plug 'moll/vim-bbye'

	" Git integration
	Plug 'jreybert/vimagit'
	Plug 'airblade/vim-gitgutter'

	" Language tooling
	Plug 'sheerun/vim-polyglot'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" When there are new plugins, the color scheme should be activated
" before vim-plug does its thing. Of course, this can only happen if
" the colorscheme has been previously downloaded, so there's not a lot
" we can do about the first install: it'll probably just always be
" ugly.
if filereadable(stdpath('config') . "/plugins/dracula/colors/dracula.vim")
	colorscheme dracula
endif

" Install missing plugins on startup.
if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
	echo "Installing missing plugins. Please wait..."
	PlugInstall --sync | q
	echo "Done!"
endif

" Set the leader to ,
let mapleader = ","

" Set the encoding to UTF-8.
set encoding=utf-8

" Use the system clipboard.
set clipboard=unnamed

" Set the length of the vim command history.
set history=1000

" Allow buffer switching without saving.
set hidden

" Allow cursor positioning one character past the end of the line.
set virtualedit=onemore

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

" Show matching brackets/parens
set showmatch

" Show list of possible completions instead of just completing.
set wildmenu

" Show problematic whitespace
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

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

" Disable python2 support in Neovim
let g:loaded_python_provider = 0

" Set the color scheme to dracula
colorscheme dracula
let g:airline_theme = 'dracula'

" Use the dark variant of the theme.
set background=dark

" Set GUI-specific options
if has('gui_running') || has('gui_vimr')
	" Turn off extra GUI stuff.
	set guioptions=

	" Use true colors if possible.
	if (has('termguicolors'))
		set termguicolors
	endif
endif

" Turn on line numbering.
set number

" Use the last two lines for status.
set laststatus=2

" Highlight the cursor line.
set cursorline

" Show what mode vim is in.
set showmode

" Draw a vertical ruler for formatting assistance.
set colorcolumn=80

" Don't show the mode in the second status line. Airline takes care of
" that.
set noshowmode

" If a file has been changed outside of vim, automatically reload it.
set autoread

" autoread only triggers if an external command is run, so we'll fake
" it with checktime on several common events.
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
	\ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" When autoread kicks in, show a warning message.
autocmd FileChangedShellPost *
	\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Set split behavior.
set splitright  " vsplit opens new window to the right
set splitbelow  " split opens new window below

" Turn on Airline/Fugitive integration.
let g:airline#extensions#branch#enabled = 1

" Turn off gitgutter's realtime feature. Signs will still update when you
" switch buffers or tabs, focus the GUI, save a buffer, etc. There's no need
" to continuously run `git status` every four seconds.
let g:gitgutter_realtime = 0

" Always show the signcolumn. Otherwise, it would shift the text every
" time diagnostics appear/become resolved.
set signcolumn=yes

" Some language servers have issues with backup files, so turn them off.
set nobackup
set nowritebackup

" Make help windows open as a vsplit to the right.
function! OpenHelpRight()
	if !exists('w:help_is_moved') || w:help_is_moved != "right"
		wincmd L
		let w:help_is_moved = "right"
	endif
endfunction
augroup HelpPages
	autocmd FileType help nested call OpenHelpRight()
augroup END

" Do not register an omnifunc for vim-go. Instead, it'll run through
" coc.nvim
let g:go_code_completion_enabled = 0

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

" Home and End should go to the beginning and end of a buffer, rather
" than a line.
nnoremap <Home> gg
nnoremap <End> G

" <leader>q closes a buffer without messing up windows, layouts, etc.
nnoremap <leader>q :Bdelete<CR>

" Clear searches on ESC.
nnoremap <esc> :let @/ = ""<return><esc>

" Navigate splits with Ctrl + h,j,k,l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" caw.vim comment toggle
nnoremap <leader>/ <Plug>(caw:hatpos:toggle)
vnoremap <leader>/ <Plug>(caw:hatpos:toggle)

" Use fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>s :Ack<space>

" coc.nvim
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gr <Plug>(coc-references)

" helper for editing my vim config
nnoremap <leader>vc :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>vr :source ~/.config/nvim/init.vim<CR>


"
"Current TODO:
" * Build a plugin that lets me :c projectname to switch to ~/Code/projectname
"   and load the previous session (which should live somewhere other than the
"   project dir)
" * If I open any file inside of any of my projects (dir inside ~/Code), set
"   the cwd to the project root
" * tpope/obsession to handle auto-saving a session?
"
