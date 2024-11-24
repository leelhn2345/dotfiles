return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach", -- Or `LspAttach`
  priority = 1000, -- needs to be loaded in first
  config = function()
    vim.diagnostic.config({ virtual_text = false })
    require("tiny-inline-diagnostic").setup({
      options = {
        -- Enable diagnostic message on all lines.
        multilines = true,
        -- Show all diagnostics on the cursor line.
        show_all_diags_on_cursorline = true,
      },
    })
  end,
}
