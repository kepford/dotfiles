return {
  "olimorris/codecompanion.nvim",
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>cc", function() require("codecompanion").chat() end, desc = "CodeCompanion Chat" },
    { "<leader>ce", function() require("codecompanion").explain() end, desc = "Explain Code" },
    { "<leader>cf", function() require("codecompanion").fix() end, desc = "Fix Code" },
  },
}
