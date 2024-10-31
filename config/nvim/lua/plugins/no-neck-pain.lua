return {
  "shortcuts/no-neck-pain.nvim",
  lazy = false,
  opts = {
    autocmds = {
      enableOnVimEnter = true,
    },
  },
  keys = {
    {
      "<leader>np",
      ":NoNeckPain<CR>",
      desc = "Toggles neck pain",
      silent = true,
    },
  },
  cmd = { "NoNeckPain" },
}
