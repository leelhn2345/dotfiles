return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  opts = {
    options = {
      -- Enable diagnostic message on all lines.
      multilines = {
        enabled = true,
        always_show = true,
      },
      -- Show all diagnostics on the cursor line.
      show_all_diags_on_cursorline = true,
    },
  },
  config = function(_, opts)
    require("tiny-inline-diagnostic").setup(opts)
  end,
}
