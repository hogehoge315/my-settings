return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,      -- 起動時に必ず読み込む（テーマはこれが安定）
  priority = 1000,   -- 他のUI系より先
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      color_overrides = {
	mocha = {
            base = "#12121a",
            mantle = "#12121a",
            crust = "#12121a",
        },
    },
    transparent_background = true,
      integrations = {
	telescope = { enabled = true },
        lualine = true,
        treesitter = true,
        indent_blankline = { enabled = true },
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
