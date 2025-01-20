return {
  "shortcuts/no-neck-pain.nvim",
  lazy = false,
  version = "2.1.3",
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
