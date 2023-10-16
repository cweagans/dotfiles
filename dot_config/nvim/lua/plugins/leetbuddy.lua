return {
  {
    "Dhanus3133/LeetBuddy.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      language = "go",
    },
    keys = {
      { "<leader>lq", "<cmd>LBQuestions<cr>", desc = "List Questions" },
      { "<leader>ll", "<cmd>LBQuestion<cr>", desc = "View Question" },
      { "<leader>lr", "<cmd>LBReset<cr>", desc = "Reset Code" },
      { "<leader>lt", "<cmd>LBTest<cr>", desc = "Run Code" },
      { "<leader>ls", "<cmd>LBSubmit<cr>", desc = "Submit Code" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["g"] = { name = "+goto" },
        ["<leader>l"] = { name = "+leetcode" },
      },
    },
  },
}
