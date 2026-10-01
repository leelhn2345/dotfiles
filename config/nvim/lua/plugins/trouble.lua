return {
  "folke/trouble.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      "<leader>q",
      ":Trouble diagnostics toggle<CR>",
      desc = "Diagnostics (Trouble)",
      silent = true,
    },
  },
  opts = {
    auto_close = true,
    focus = true,
    win = {
      wo = {
        wrap = true,
      },
    },
  },
}
