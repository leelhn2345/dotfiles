return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  ft = { "markdown" },
  keys = {
    {
      "<leader>rm",
      ":RenderMarkdown toggle<CR>",
      desc = "RenderMarkdown Toggle",
      silent = true,
    },
  },
  opts = {
    sign = {
      enabled = false,
    },
    heading = {
      icons = {},
      width = "block",
      right_pad = 1,
    },
    code = {
      width = "block",
      right_pad = 1,
      style = "language",
      language_border = "",
    },
  },
}
