local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- Actions.
  b.code_actions.proselint,
  b.code_actions.shellcheck,

  -- Diagnostics.
  b.diagnostics.actionlint,
  b.diagnostics.alex,
  b.diagnostics.codespell,
  b.diagnostics.commitlint,
  b.diagnostics.editorconfig_checker.with({ command = "editorconfig-checker" }),
  b.diagnostics.gitlint,
  b.diagnostics.golangci_lint,
  b.diagnostics.jsonlint,
  b.diagnostics.php,
  b.diagnostics.phpcs,
  b.diagnostics.phpstan,
  b.diagnostics.proselint,
  b.diagnostics.protolint,
  b.diagnostics.ruff,
  b.diagnostics.shellcheck,
  b.diagnostics.sqlfluff,
  b.diagnostics.twigcs,
  b.diagnostics.vale,
  b.diagnostics.write_good,
  b.diagnostics.yamllint,

  -- Formatting.
  b.formatting.black,
  b.formatting.blade_formatter,
  b.formatting.goimports,
  b.formatting.jq,
  b.formatting.phpcsfixer,
  b.formatting.prettier,
  b.formatting.protolint,
  b.formatting.ruff,
  b.formatting.shellharden,
  b.formatting.sqlfluff,
  b.formatting.stylua,
  b.formatting.terraform_fmt,
}

null_ls.setup({
  debug = true,
  sources = sources,
})
