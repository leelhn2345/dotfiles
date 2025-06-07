return {
  "coder/claudecode.nvim",
  dependencies = {
    "folke/snacks.nvim", -- Optional for enhanced terminal
  },
  opts = {},
  keys = {
    {
      "<leader>cc",
      "<cmd>ClaudeCode<cr>",
      mode = { "t", "n" },
      desc = "Toggle Claude",
    },
    {
      "<leader>cs",
      "<cmd>ClaudeCodeSend<cr>",
      mode = "v",
      desc = "Send to Claude",
    },
  },
}
