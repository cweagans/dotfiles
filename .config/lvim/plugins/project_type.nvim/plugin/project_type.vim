if exists('g:loaded_project_type')
  finish
endif
let g:loaded_project_type = 1

" Init the configuration as soon as the plugin is loaded.
lua require("project_type"):init()

" Allow the user to manually trigger a project type refresh if needed.
command! ProjectTypeRefresh lua require("project_type"):refresh()

" When the dir changes, activate new config if needed.
augroup ProjectTypeAutogroup
  autocmd!
  autocmd DirChanged * lua require("project_type"):refresh()
augroup END
