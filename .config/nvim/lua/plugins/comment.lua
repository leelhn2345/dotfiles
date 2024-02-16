return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup()

    local opts = { noremap = false, desc = "Toggle Comment" }

    vim.api.nvim_set_keymap("n", "<C-_>", "gcc", opts)
    vim.api.nvim_set_keymap("v", "<C-_>", "gcc", opts)
  end,
}
