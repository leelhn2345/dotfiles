return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup({
      options = {
        theme = "tokyonight",
        globalstatus = true,
      },
      sections = {
        lualine_b = { "branch", "diagnostics" },
      },
    })
  end,
}
