return {
  "laytan/cloak.nvim",
  opts = {
    cloak_character = "∙",
    patterns = {
      {
        file_pattern = ".env",
        cloak_pattern = "=.+",
      },
    },
  },
}
