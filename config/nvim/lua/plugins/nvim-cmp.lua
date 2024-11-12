return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
    -- "brenoprata10/nvim-highlight-colors",
    "roobert/tailwindcss-colorizer-cmp.nvim", -- colors in code completions
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      preselect = cmp.PreselectMode.None,
      completion = {
        completeopt = "menu,menuone,preview",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        -- ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({
          select = true,
          behavior = cmp.ConfirmBehavior.Insert,
        }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),

      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = function(entry, item)
          item = require("lspkind").cmp_format({
            -- any lspkind format settings here
            maxwidth = 40,
            ellipsis_char = "...",
            menu = {},
          })(entry, item)

          -- local color_item =
          --   require("nvim-highlight-colors").format(entry, { kind = item.kind })

          -- if color_item.abbr_hl_group then
          --   item.kind_hl_group = color_item.abbr_hl_group
          --   item.kind = color_item.abbr
          -- end
          -- return item

          return require("tailwindcss-colorizer-cmp").formatter(entry, item)
        end,

        -- format = lspkind.cmp_format({
        --   maxwidth = 40,
        --   ellipsis_char = "...",
        --   menu = {},

        -- menu = {
        --   buffer = "[Buffer]",
        --   nvim_lsp = "[LSP]",
        --   luasnip = "[Snippet]",
        --   path = "[Path]",
        -- },

        -- truncate lsp source path
        -- before = function(_, item)
        --   local MAX_MENU_WIDTH = 20
        --   local ELLIPSIS = "..."
        --
        --   if item.menu ~= nil then
        --     local menu = item.menu
        --     if #menu > MAX_MENU_WIDTH then
        --       item.menu = vim.fn.strcharpart(menu, 0, MAX_MENU_WIDTH)
        --         .. ELLIPSIS
        --     end
        --   end
        --   return item
        -- end,
        -- }),
      },
    })

    local autocomplete_group =
      vim.api.nvim_create_augroup("dadbod_completion", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "sql", "mysql", "plsql" },
      callback = function()
        cmp.setup.buffer({
          sources = {
            { name = "vim-dadbod-completion" },
          },
        })
      end,
      group = autocomplete_group,
    })

    -- highlight overrides
    vim.api.nvim_set_hl(
      0,
      "CmpItemKindVariable",
      { bg = "NONE", fg = "#deb887" }
    )
    vim.api.nvim_set_hl(
      0,
      "CmpItemKindInterface",
      { link = "CmpItemKindVariable" }
    )
  end,
}
