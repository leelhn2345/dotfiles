vim.api.nvim_set_keymap(
  "n",
  "<leader>r",
  ":lua require('kulala').run()<CR>",
  { desc = "Run request", noremap = true, silent = true }
)
