-- Generated at https://www.asciiart.eu/text-to-ascii-art. Font is ANSI Shadow.
local logo = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]]
logo = string.rep("\n", 4) .. logo .. "\n\n"

return {
  "nvimdev/dashboard-nvim",
  opts = {
    config = {
      -- Replace logo
      header = vim.split(logo, "\n"),
    },
    hide = {
      -- Don't hide the tabline. It auto-hides.
      tabline = false,
    },
  },
}
