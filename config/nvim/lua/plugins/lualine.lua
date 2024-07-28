return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup({
      options = {
        globalstatus = true,
      },
      sections = {
        lualine_b = {
          "branch",
          {
            "diagnostics",
            sources = {
              "nvim_workspace_diagnostic",
            },
          },
        },
      },
    })
  end,
}
