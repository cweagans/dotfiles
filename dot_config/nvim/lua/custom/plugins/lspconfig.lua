local servers = {
  ansiblels = {},
  arduino_language_server = {},
  bashls = {},
  cssls = {},
  clangd = {},
  dockerls = {},
  gopls = {},
  html = {},
  intelephense = {},
  jqls = {},
  jsonls = {},
  pylsp = {},
  sqls = {},
  sumneko_lua = {},
  svelte = {},
  tailwindcss = {},
  terraformls = {},
  vimls = {},
  vuels = {},
  yamlls = {},
}

-- Only need to edit above.

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

for lsp, config in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = config,
  })

end
