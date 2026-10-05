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
    focus = true,
    modes = {
      diagnostics = {
        auto_close = true,
      },
    },
    win = {
      wo = {
        wrap = true,
      },
    },
  },
}
