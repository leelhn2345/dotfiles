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
      "<leader>eq",
      ":TodoTrouble toggle<CR>",
      desc = "Find Todos",
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
