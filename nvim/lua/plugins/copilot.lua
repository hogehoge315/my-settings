return {
  "github/copilot.vim",
  init = function()
    vim.g.copilot_no_tab_map = true
    vim.keymap.set("i", "<C-l>", 'copilot#Accept("<CR>")', {
      expr = true,
      silent = true,
      noremap = true,
    })
  end,
}
