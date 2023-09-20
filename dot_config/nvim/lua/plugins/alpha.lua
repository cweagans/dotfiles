local logo = [[
██╗   ██╗██╗███╗   ███╗
██║   ██║██║████╗ ████║
██║   ██║██║██╔████╔██║
╚██╗ ██╔╝██║██║╚██╔╝██║
 ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═══╝  ╚═╝╚═╝     ╚═╝
]]

return {
  "goolord/alpha-nvim",
  opts = {
    section = {
      header = {
        val = vim.split(logo, "\n"),
      },
    },
  },
}
