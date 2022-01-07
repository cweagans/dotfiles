-- Set up some common null-ls items.
require("null-ls").register({
  -- Always trim whitespace from EOL.
  require('null-ls.builtins.formatting.trim_whitespace').with{ name = "trim_whitespace" },

  -- Add code actions Git operations (stage, preview, reset hunks, blame, etc)
  require('null-ls.builtins.code_actions.gitsigns'),
})

