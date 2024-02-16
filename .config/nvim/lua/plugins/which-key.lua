return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {},

  config = function()
    local wk = require("which-key")

    wk.register({
      f = {
        name = "file",
      },
    }, { prefix = "<leader>" })

    wk.register({
      e = {
        name = "explorer",
      },
    }, { prefix = "<leader>" })

    wk.register({
      h = {
        name = "harpoon",
      },
    }, { prefix = "<leader>" })

    wk.register({
      p = {
        name = "Peek",
      },
    }, { prefix = "g" })
  end,
}
