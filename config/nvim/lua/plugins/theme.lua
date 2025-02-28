return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
    on_highlights = function(highlights, _)
      highlights["Pmenu"] = { bg = "NONE", fg = "#565f89" }
      highlights["BlinkCmpKindVariable"] = { bg = "NONE", fg = "#deb887" }
      highlights["BlinkCmpKindInterface"] = { bg = "NONE", fg = "#deb887" }
      highlights["CmpItemKindVariable"] = { bg = "NONE", fg = "#deb887" }
      highlights["CmpItemKindInterface"] = { bg = "NONE", fg = "#deb887" }
    end,
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd("colorscheme tokyonight")
  end,
}
