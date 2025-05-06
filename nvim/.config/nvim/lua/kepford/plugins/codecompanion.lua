return {
  "olimorris/codecompanion.nvim",
  opts = {
    adapters = {
      gemini = {
        enabled = true,
        model = "gemini-pro", -- or "gemini-pro-vision" if vision needed
        api_key = vim.env.GEMINI_API_KEY, -- Secure way via environment variable
      },
    },
    default_adapter = "gemini",
  },
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
