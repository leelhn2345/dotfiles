return {
  "shortcuts/no-neck-pain.nvim",
  event = "UIEnter",
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
      skipEnteringNoNeckPainBuffer = true,
    },
  },
  config = function(_, opts)
    require("no-neck-pain").setup(opts)
    vim.cmd("NoNeckPain")
  end,
}
