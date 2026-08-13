local t = {
  none = "NONE",
  cmpBackground = "#565f89",
  cmpConstant = "#deb887",
}

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
      highlights["Pmenu"] = { bg = t.none, fg = t.cmpBackground }
      highlights["BlinkCmpKindVariable"] = { bg = t.none, fg = t.cmpConstant }
      highlights["BlinkCmpKindInterface"] = { bg = t.none, fg = t.cmpConstant }
      highlights["CmpItemKindVariable"] = { bg = t.none, fg = t.cmpConstant }
      highlights["CmpItemKindInterface"] = { bg = t.none, fg = t.cmpConstant }
      highlights["StatusLine"] = { bg = t.none }
      highlights["StatusLineNC"] = { bg = t.none }

      -- flash.nvim
      -- highlights["FlashMatch"] = {
      --   fg = "#1a1b26",
      --   bg = "#7aa2f7",
      --   bold = true,
      -- }
      -- highlights["FlashCurrent"] = {
      --   fg = "#1a1b26",
      --   bg = "#f7768e",
      --   bold = true,
      -- }
      -- highlights["FlashLabel"] = {
      --   fg = "#c0caf5",
      --   bg = "#414868",
      --   bold = true,
      -- }
    end,
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd("colorscheme tokyonight")
  end,
}
