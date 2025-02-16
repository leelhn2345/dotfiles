return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    bigfile = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },

    styles = {
      input = {
        relative = "cursor",
      },
    },
  },
}
