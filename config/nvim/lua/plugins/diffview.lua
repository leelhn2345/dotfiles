return {
  "sindrets/diffview.nvim",
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
  },
  opts = {
    keymaps = {
      view = { { "n", "q", ":tabc<CR>", { desc = "Quit diffview" } } },
      file_panel = { { "n", "q", ":tabc<CR>", { desc = "Quit diffview" } } },
    },
  },
}
