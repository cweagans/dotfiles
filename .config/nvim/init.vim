" IT'S TRADITION, OKAY?
set nocompatible

" Make sure we have XDG variables set.
if empty($XDG_CONFIG_HOME)
  let $XDG_CONFIG_HOME = $HOME . "/.config"
endif
if empty($XDG_CACHE_HOME)
  let $XDG_CACHE_HOME = $HOME . "/.cache"
endif

" Set up a variable that points to the config home.
let $NVIM_CONFIG_HOME = $XDG_CONFIG_HOME . '/nvim'

" Download and source vim-plug if it's not already present.
if empty(glob($NVIM_CONFIG_HOME . '/autoload/plug.vim'))
  silent !curl -fLo $NVIM_CONFIG_HOME/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  source $NVIM_CONFIG_HOME/autoload/plug.vim
endif

" Grab everything from requirements.d and dump it into plugin.vim
function! BuildPluginDotVim()
  silent !cat $NVIM_CONFIG_HOME/requirements.d/*.vim > $NVIM_CONFIG_HOME/plugin.vim
endfunction

" If plugin.vim doesn't exist, build it...
if empty(glob($NVIM_CONFIG_HOME . '/plugin.vim'))
  call BuildPluginDotVim()
endif

" ...and then source it.
runtime! plugin.vim

" Now that we have our plugins defined, we need to make sure they're actually
" installed.
if empty(glob($NVIM_CONFIG_HOME . '/plugins'))
  PlugInstall!
endif

" Finally, load all configuration files.
runtime! conf.d/*.vim
