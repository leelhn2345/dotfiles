return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
  },
  opts = {},
  keys = {
    {
      "<leader>l",
      ":TodoTrouble toggle<CR>",
      desc = "Todo list",
      silent = true,
    },
  },
}

-- keywords recognized as todo comments
-- FIX:
-- BUG:
-- ISSUE:
-- TODO:
-- HACK:
-- WARN:
-- PERF:
-- NOTE:
-- INFO:
