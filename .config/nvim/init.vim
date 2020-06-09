"
" My vim configuration
"
" This file contains the complete configuration for my daily driver vim
" configuration. It may or may not be useful for you as it's heavily tailored
" to how I want my vim to work.
"
" @FUTURE:
" 	- Get go debugging working
" 	- Get php debugging working
" 	- Get linting working
" 	- Get coc.nvim working with vim-language-server
" 	- Set up TIL repo on Github (like this: https://github.com/simonw/til)
" 	- Sort through https://github.com/luan/nvim/blob/master/plug.vim to see if there's anything else of interest
" 	- set up plugins for FED: html5, vue, javascript
" 	- Decide if I want to use vim for presentations: https://github.com/tybenz/vimdeck
" 	- Add Dart completion
" 	- Get coc.nvim working with lua language server
" 	- Get coc.nvim working with bash language server
" 	- Get coc.nvim working with docker language server
" 	- Go through https://github.com/liuchengxu/vim-better-default/blob/master/plugin/default.vim to see if there's anything of interest
"

" Environment setup {{{
	" We need to determine if we're running in Neovim or not. Do the check once and
	" hang onto the result in a global.
	let g:is_neovim = has('nvim')

	" If we're running in Neovim mode, we need to know where the config base directory
	" is. By default, this is $XDG_CONFIG_HOME/nvim, but we need to make sure we have
	" that environment variable if we need it. We'll set it to the default value if
	" it's not already set.
	if g:is_neovim && empty($XDG_CONFIG_HOME)
		" Normally, we would avoid changing envvars, but since this is a fairly
		" standard one, we'll do it just this once.
		let $XDG_CONFIG_HOME = $HOME . '/.config'
	endif

	" Make sure that my $PATH is set correctly. When launching vimr from
	" Alfred, my $PATH is just set to the defaults, so various things
	" don't work as expected.
	if $PATH !~ "/Users/cweagans/Code/go"
		let $PATH = '/usr/local/opt/llvm/bin:/usr/local/opt/mysql-client/bin:/Users/cweagans/bin:/Users/cweagans/.config/composer/vendor/bin:/Users/cweagans/Code/go/bin:/Users/cweagans/Code/npm/bin:/Users/cweagans/Code/flutter/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/Applications/kitty.app/Contents/MacOS'
	endif

	" Finally, we'll define the root directory of the config.
	let g:vim_home = $HOME . "/.vim"
	if g:is_neovim
		let g:vim_home = $XDG_CONFIG_HOME . "/nvim"
	endif

" }}}



" Plugin manager {{{
	" We need a plugin manager to be able to do anything as vim starts up,
	" so we'll make sure we have one available here.
	if !filereadable(g:vim_home . "/autoload/plug.vim")
		let s:plug_path = g:vim_home . "/autoload/plug.vim"
		execute "silent !curl -fLo " . s:plug_path . " --create-dirs " .
			\ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
	endif
" }}}



" Plugins {{{
	" Define plugins.
	call plug#begin(g:vim_home . '/plugins')
		" Defaults
		Plug 'editorconfig/editorconfig-vim'
		Plug 'tpope/vim-commentary'
		Plug 'Townk/vim-autoclose'
		Plug 'farmergreg/vim-lastplace'

		" UI
		Plug 'dracula/vim', { 'as': 'dracula' }
		Plug 'vim-airline/vim-airline'
		Plug 'mhinz/vim-startify'
		Plug 'junegunn/fzf', {'do': './install --bin'}
		Plug 'junegunn/fzf.vim'
		Plug 'wincent/ferret'
		Plug 'kshenoy/vim-signature'
		Plug 'tpope/vim-vinegar'
		Plug 'moll/vim-bbye'

		" Git integration
		Plug 'jreybert/vimagit'
		Plug 'airblade/vim-gitgutter'

		" Language tooling
		Plug 'neoclide/coc.nvim', {'branch': 'release'}
		Plug 'liuchengxu/vista.vim'
		Plug 'sheerun/vim-polyglot'
		Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

		" Writing and organizational tools
		Plug 'vimwiki/vimwiki'
		Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
		Plug 'junegunn/goyo.vim'
		Plug 'junegunn/limelight.vim'

		" Misc
		Plug 'mhinz/vim-rfc'

	call plug#end()

	" When there are new plugins, the color scheme should be activated
	" before vim-plug does its thing. Of course, this can only happen if
	" the colorscheme has been previously downloaded, so there's not a lot
	" we can do about the first install: it'll probably just always be
	" ugly.
	if filereadable(g:vim_home . "/plugins/dracula/colors/dracula.vim")
		colorscheme dracula
	endif

	" Install missing plugins on startup.
	if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
		echo "Installing missing plugins. Please wait..."
		PlugInstall --sync | q
		echo "Done!"
	endif
" }}}



" Config {{{
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

	" Automatically cd to vcs root when opening a file from the startify menu.
	let g:startify_change_to_vcs_root = 1

	" Set the startify header
	let g:startify_custom_header = [
			\ '	███    ██ ███████  ██████  ██    ██ ██ ███    ███',
			\ '	████   ██ ██      ██    ██ ██    ██ ██ ████  ████',
			\ '	██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██',
			\ '	██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██',
			\ '	██   ████ ███████  ██████    ████   ██ ██      ██',
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

	" Set up a bookmark for Vigor configuration
	let g:startify_bookmarks = [{ 'v': g:vim_home . "/init.vim" }]

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

	" Configure vimwiki
	let wiki = {}
	let wiki.path = "~/Dropbox/Wiki"
	let wiki.syntax = "markdown"
	let wiki.ext = ".md"
	let wiki.auto_toc = 1
	let wiki.diary_rel_path = "journal/"
	let wiki.diary_index = "journal"
	let wiki.diary_header = "Journal"
	let wiki.auto_diary_index = 1
	let g:vimwiki_list = [wiki]

	" Turn on mouse support in vimwiki
	let g:vimwiki_use_mouse = 1

	" Not all markdown files are part of the wiki
	let g:vimwiki_global_ext = 0

	" Automatically cd to the Wiki directory when a wiki page is opened.
	autocmd Filetype vimwiki cd ~/Dropbox/Wiki

	" Do not register an omnifunc for vim-go. Instead, it'll run through
	" coc.nvim
	let g:go_code_completion_enabled = 0

	" Set the goyo width to 120
	let g:goyo_width = 120

	" Define a function for toggling goyo, limelight, and text wrapping
	" for prose files.
	function! ToggleGoyo()
		if exists('#goyo')
			Goyo!
			Limelight!
			setlocal nowrap
			setlocal colorcolumn=80
			setlocal nolinebreak
			setlocal nospell
		else
			Goyo
			Limelight
			setlocal wrap
			setlocal colorcolumn=
			setlocal linebreak
			setlocal spell
		endif
	endfunction

	" Turn on front matter support for markdown
	let g:vim_markdown_frontmatter = 1

	" Automatic, smart link generation for vimwiki.
	function! VwGenerateLinks()
		if expand('%:p') =~ $HOME . '/Dropbox/Wiki/Journal'
			VimwikiDiaryGenerateLinks
		elseif expand('%:p') == $HOME . '/Dropbox/Wiki/index.md'
			VimwikiGenerateLinks
		else
			VimwikiGenerateLinks expand('%:p:h:t') . '/*.md'
		endif
	endfunction
" }}}



" Keymap {{{

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

	" Commentary
	nnoremap <leader>/ :Commentary<CR>
	vnoremap <leader>/ :Commentary<CR>

	" Navigate splits with Ctrl + h,j,k,l
	nnoremap <C-h> <C-w>h
	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-l> <C-w>l

	" Use fzf
	nnoremap <leader>f :Files<CR>
	nnoremap <leader>b :Buffers<CR>
	nnoremap <leader>s :Ack<space>

	" Markdown helpers
	nnoremap <leader>mp :MarkdownPreview<CR>
	nnoremap <leader>mps :MarkdownPreviewStop<CR>
	nnoremap <leader>df :call ToggleGoyo()<CR>

	" vimwiki
	nnoremap <leader>wgl :call VwGenerateLinks()<CR>

	" coc.nvim
	nmap <silent> <leader>gd <Plug>(coc-definition)
	nmap <silent> <leader>gr <Plug>(coc-references)
	
" }}}
