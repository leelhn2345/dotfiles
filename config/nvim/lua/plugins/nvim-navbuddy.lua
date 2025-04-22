return {
  -- breadcrumbs
  "SmiteshP/nvim-navbuddy",
  event = "VeryLazy",
  dependencies = {
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
  opts = { lsp = { auto_attach = true } },
}
