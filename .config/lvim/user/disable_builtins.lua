-- Disable some of the plugins that come bundled with vim.
local disabled_builtins = {
  '2html_plugin',
  'getscript',
  'getscriptPlugin',
  'gzip',
  'logiPat',
  'man',
  'matchit',
  'matchparen',
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'rrhelper',
  'shada_plugin',
  'spellfile_plugin',
  'tar',
  'tarPlugin',
  'tutor',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin',
}

for _, plugin in pairs(disabled_builtins) do
  vim.g['loaded_' .. plugin] = 1;
end
