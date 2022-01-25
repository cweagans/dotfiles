local nlsp = require('lspconfig')

local function file_exists(path)
  local f = io.open(path, "r")
  if f ~= nil then io.close(f) return true else return false end
end

-- Determine if a project is a PHP project or not.
local function detect_php()
  local files = { "composer.json", "composer.lock" }
  for _, path in pairs(files) do
    if file_exists(path) then
      return true
    end
  end

  return false
end

-- Enable php linting.
local function config_php()
  local linters = require("lvim.lsp.null-ls.linters")
  linters.setup({{
    exe = "php",
    args = { "-l", "-d", "display_errors=STDERR", "-d", " log_errors=Off" }
  }})
end

-- Determine if a project has phpstan set up
local function detect_phpstan()
  if not detect_php() then
    return false
  end
  local files = { "phpstan.neon" }
  for _, path in pairs(files) do
    if file_exists(path) then
      return true
    end
  end

  return false
end

-- Enable phpstan diagnostics.
local function config_phpstan()
  local linters = require("lvim.lsp.null-ls.linters")
  linters.setup({{
    exe = "phpstan",
    args = { "-l", "-d", "display_errors=STDERR", "-d", " log_errors=Off" }
  }})
end

-- If we can find Drupal.php in one of these locations, it's probably a Drupal project.
local function detect_drupal()
  local files = { "core/lib/Drupal.php", "docroot/core/lib/Drupal.php", "web/core/lib/Drupal.php" }
  for _, path in pairs(files) do
    if file_exists(path) then
      return true
    end
  end

  return false
end

-- Locate the Drupal coder ruleset (preferring project-provided copies)
local function find_drupal_coder_ruleset()
  local files = {
    "./docroot/vendor/drupal/coder/coder_sniffer/Drupal/ruleset.xml",
    "./vendor/drupal/coder/coder_sniffer/Drupal/ruleset.xml",
    "~/.config/composer/vendor/drupal/coder/coder_sniffer/Drupal/ruleset.xml",
  }
  for _, path in pairs(files) do
    if file_exists(vim.fn.expand(path)) then
      return path
    end
  end

  return false
end

-- If we're in a Drupal project, try to set up phpcbf as a formatter using the
-- Drupal coder module ruleset and completely disable intelephense as a formater.
local function config_drupal()
  local formatters = require("lvim.lsp.null-ls.formatters")
  local linters = require("lvim.lsp.null-ls.linters")

  local ruleset_path = find_drupal_coder_ruleset()

  -- If no ruleset path can be found, then exit early.
  if ruleset_path == false then
    return
  end

  -- The double-table here and below are intentional. setup() wants a table of
  -- tables, not just an individual table for the thing you want to set up.
  formatters.setup({{
    exe = "phpcbf",
    args = { "--standard=" .. ruleset_path, "-" }
  }})
  linters.setup({{
    exe = "phpcs",
    args = { "--standard=" .. ruleset_path, "--report=json", "-s", "-" }
  }})

  -- Intelephense will only do PSR-12 formatting, so just disable the formatting
  -- capability when working on Drupal projects. Note that the formatting will
  -- still happen, but neovim will not respond to requests to update the buffer.
  lvim.lsp.on_attach_callback = function(client, _)
    if client.name == "intelephense" then
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
    end
  end
end

-- Determine if a project is a Flutter project or not.
local function detect_flutter()
  local files = { "pubspec.yaml", "pubspec.lock" }
  for _, path in pairs(files) do
    if file_exists(path) then
      return true
    end
  end

  return false
end

-- Enable flutte linting and other tools
local function config_flutter()
  require("flutter-tools").setup({})

  -- Let's let dartls do flutter formatting.
  lvim.lsp.on_attach_callback = function(client, _)
    if client.name == "null-ls" then
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
    end
  end
end

-- Determine if a project is a Go project or not.
local function detect_go()
  local files = { "go.mod", "go.sum", "main.go" }
  for _, path in pairs(files) do
    if file_exists(path) then
      return true
    end
  end

  return false
end

-- Set up the go plugin.
local function config_go()
  require('go').setup()

  -- Let's let dartls do flutter formatting.
  lvim.lsp.on_attach_callback = function(client, _)
    if client.name == "null-ls" then
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
    end
  end
end

-- Determine if a project is a nodejs project
local function detect_nodejs()
  local files = { "package.json", "package-lock.json" }
  for _, path in pairs(files) do
    if file_exists(path) then
      return true
    end
  end

  return false
end

-- Enable nodejs stuff
local function config_nodejs()
  require("lvim.lsp.manager").setup("eslint")
end

-- Determine if a project is a svelte project
local function detect_svelte()
  local files = { "src/App.svelte" }
  for _, path in pairs(files) do
    if file_exists(path) then
      return true
    end
  end

  return false
end

-- Enable svelte stuff
local function config_svelte()
  require("lvim.lsp.manager").setup("svelte")
end

function ConfigureProject()
  if detect_php() then
    config_php()
  end

  if detect_phpstan() then
    config_phpstan()
  end

  if detect_drupal() then
    config_drupal()
  end

  if detect_flutter() then
    config_flutter()
  end

  if detect_go() then
    config_go()
  end

  if detect_nodejs() then
    config_nodejs()
  end

  if detect_svelte() then
    config_svelte()
  end
end

vim.cmd([[
augroup ProjectType
  autocmd!
  autocmd DirChanged * lua ConfigureProject()
  autocmd BufReadPre * lua ConfigureProject()
augroup END
]])
