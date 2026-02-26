return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "zbirenbaum/copilot-cmp",
  },

  config = function()
    local cmp = require("cmp")

    vim.opt.completeopt = { "menu", "menuone", "noselect" }

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },

      mapping = {
        -- Tabで確定
        ["<Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          else
            fallback()
          end
        end,

        -- Shift+Tabで前候補
        ["<S-Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end,

        -- 候補移動
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),

        -- ドキュメントスクロール
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),

        -- 補完中止
        ["<C-e>"] = cmp.mapping.abort(),

        -- Enterは改行優先（VSCode寄せ）
        ["<CR>"] = function(fallback)
          fallback()
        end,
      },

      sources = cmp.config.sources({
        { name = "copilot" }, -- 最優先
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}
