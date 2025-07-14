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
    {
      "<leader>cr",
      "<cmd>ClaudeCode --resume<cr>",
      desc = "Resume Claude",
    },
    {
      "<leader>cC",
      "<cmd>ClaudeCode --continue<cr>",
      desc = "Continue Claude",
    },
    {
      "<leader>cb",
      "<cmd>ClaudeCodeAdd %<cr>",
      desc = "Add current buffer to Claude",
    },
  },
}
