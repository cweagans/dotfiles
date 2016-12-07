let dir_list = {
  \ 'backupdir': $XDG_CACHE_HOME . '/nvim/backup',
  \ 'viewdir': $XDG_CACHE_HOME . '/nvim/views',
  \ 'directory': $XDG_CACHE_HOME . '/nvim/swap'}

if has('persistent_undo')
  let dir_list['undodir'] = $XDG_CACHE_HOME . '/nvim/undo'
endif

for [settingname, dirname] in items(dir_list)
  if !isdirectory(dirname)
    silent execute '!mkdir -p ' . dirname
  endif

  if !isdirectory(dirname)
    echo "Warning: Unable to create directory: " . dirname
    echo "Try: mkdir -p " . dirname
  else
    let directory = substitute(dirname, " ", "\\\\ ", "g")
    exec "set " . settingname . "=" . directory
  endif
endfor

" Set up the runtime path to be compliant with XDG.
set runtimepath=$XDG_CONFIG_HOME/nvim,$XDG_CONFIG_HOME/nvim/after,$VIM,$VIMRUNTIME
