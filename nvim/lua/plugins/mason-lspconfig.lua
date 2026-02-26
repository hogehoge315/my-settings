return {
  "mason-org/mason-lspconfig.nvim",
  lazy = false,
  dependencies = { "mason-org/mason.nvim" },
  config = function()
    local lsp_servers = { "lua_ls", "pyright", "ruff", "ts_ls", "html", "yamlls", "jsonls" }
    local diagnostics = { "typos_lsp" }

    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_flatten({ lsp_servers, diagnostics }),
      -- automatic_enable はデフォルトで true（＝インストール済みを自動で vim.lsp.enable する）
      -- 必要なら明示: automatic_enable = true,
    })

    -- setup_handlers は v2 では使わない（ここが今回のクラッシュ原因）
  end,
}
