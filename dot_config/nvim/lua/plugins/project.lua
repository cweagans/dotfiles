return {
  "ahmedkhalf/project.nvim",
  opts = {
    -- TODO: Set this automatically from various language plugins?
    patterns = {
      ".git",
      "Makefile",
      "package.json",
      "go.mod",
      ".neoconf.json",
    },
    scope_chdir = "tab",
    open_file_finder = false,
  },
}
