return {
  -- breadcrumbs
  "SmiteshP/nvim-navbuddy",
  lazy = true,
  dependencies = {
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
  opts = { lsp = { auto_attach = true } },
}
