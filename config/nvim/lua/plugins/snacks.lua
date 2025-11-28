return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    bigfile = { enabled = true },
    -- indent = { enabled = true },
    input = { enabled = true },
    terminal = {
      win = {
        keys = {
          term_normal = {
            "<esc>",
            function()
              vim.cmd("stopinsert")
            end,
            mode = "t",
            expr = true,
            desc = "Escape to normal",
          },
        },
      },
    },

    styles = {
      input = {
        relative = "cursor",
      },
    },
  },
}
