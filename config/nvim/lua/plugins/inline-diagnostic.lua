return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach",
  config = function()
    vim.diagnostic.config({ virtual_text = false })

    require("tiny-inline-diagnostic").setup({
      options = {
        -- Enable diagnostic message on all lines.
        multilines = {
          enabled = true,
          always_show = true,
        },
        -- Show all diagnostics on the cursor line.
        show_all_diags_on_cursorline = true,
      },
    })
  end,
}
