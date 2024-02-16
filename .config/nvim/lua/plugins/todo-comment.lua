return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {},
  keys = {
    {
      "<leader>td",
      ":TodoTelescope<CR>",
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
