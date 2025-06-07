return {
  "coder/claudecode.nvim",
  dependencies = {
    "folke/snacks.nvim", -- Optional for enhanced terminal
  },
  opts = {},
  keys = {
    {
      "<leader>ac",
      "<cmd>ClaudeCode<cr>",
      mode = { "t", "n" },
      desc = "Toggle Claude",
    },
    {
      "<leader>as",
      "<cmd>ClaudeCodeSend<cr>",
      mode = "v",
      desc = "Send to Claude",
    },
  },
}
