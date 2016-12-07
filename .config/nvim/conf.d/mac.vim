" Bail out if we're not running in Macvim.
if !has('gui_macvim')
  finish
endif

" Disable the print shortcut because nobody fucking prints their code.
macm File.Print key=<nop>
