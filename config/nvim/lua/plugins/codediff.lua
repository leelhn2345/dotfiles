return {
  "esmuellert/codediff.nvim",
  cmd = "CodeDiff",
  keys = {
    {
      "<leader>de",
      ":CodeDiff<CR>",
      desc = "Diff Explorer",
      silent = true,
    },
    {
      "<leader>dh",
      ":CodeDiff history %<CR>",
      desc = "Diff History",
      silent = true,
    },
  },
}
