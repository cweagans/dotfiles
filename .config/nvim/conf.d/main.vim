" Color scheme.
syntax on

" Autocmd to set the colorscheme (deferred to after loading everything).
" colorscheme onedark
autocmd VimEnter * colorscheme onedark

" Line numbering.
set number

" Enable mouse control.
set mouse=a

" Allow cursor positioning one character past the end of the line.
set virtualedit=onemore

" Allow buffer switching without saving.
set hidden

" Highlight the cursor line.
set cursorline

" Case insensitive searching.
set ignorecase

" Turn off automatic wrapping.
set nowrap

" When vertically splitting, split to the right.
set splitright

" When horizontally splitting, split to the bottom.
set splitbelow

" Show matching brackets/parenthesis
set showmatch

" Draw a vertical ruler at 80 columns.
set colorcolumn=80

" Undo behaviors.
if has('persistent_undo')
  set undofile
  set undolevels=1000
  set undoreload=10000
endif
