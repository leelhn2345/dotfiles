return {
  "shortcuts/no-neck-pain.nvim",
  event = "BufWinEnter",
  cmd = { "NoNeckPain" },
  keys = {
    {
      "<leader>np",
      ":NoNeckPain<CR>",
      desc = "Toggles neck pain",
      silent = true,
    },
  },
  opts = {
    autocmds = {
      enableOnVimEnter = "safe",
      skipEnteringNoNeckPainBuffer = true,
    },
  },
}
