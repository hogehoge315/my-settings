return {
  -- Copilot本体
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false }, -- cmpに統合するため無効
      panel = { enabled = false },
      filetypes = { ["*"] = true },
    },
  },

  -- cmp用Copilotソース
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
