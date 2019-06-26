" Neovim GTK
if exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'Input Mono 12')
  let g:GuiInternalClipboard = 1
endif

" Neovim QT (or any other GUI that respects nvim-gui-shim)
GuiTabline 0
GuiPopupmenu 0
Guifont Input Mono:h11
