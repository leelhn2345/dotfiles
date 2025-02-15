return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    {
      "<leader>dv",
      -- function()
      --   if next(require("diffview.lib").views) == nil then
      --     vim.cmd("DiffviewOpen")
      --   else
      --     vim.cmd("tabc")
      --   end
      -- end,
      ":DiffviewOpen<CR>",
      desc = "Diff View",
      silent = true,
    },
    {
      "<leader>dh",
      ":DiffviewFileHistory %<CR>",
      desc = "Diff History",
      silent = true,
    },
  },
  opts = {
    view = {
      merge_tool = {
        layout = "diff3_mixed",
      },
    },
    keymaps = {
      view = { { "n", "q", ":tabc<CR>", { desc = "Quit diffview" } } },
      file_panel = { { "n", "q", ":tabc<CR>", { desc = "Quit diffview" } } },
      file_history_panel = {
        { "n", "q", ":tabc<CR>", { desc = "Quit diffview" } },
      },
    },
  },
}
