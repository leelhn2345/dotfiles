return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    })
    vim.cmd("colorscheme tokyonight-night")

    -- blink highligt overrides
    vim.api.nvim_set_hl(
      0,
      "BlinkCmpKindVariable",
      { bg = "NONE", fg = "#deb887" }
    )
    vim.api.nvim_set_hl(
      0,
      "BlinkCmpKindInterface",
      { link = "BlinkCmpKindVariable" }
    )

    -- cmp highligt overrides
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
