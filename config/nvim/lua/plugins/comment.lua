return {
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = { enabled_autocmd = false },
  },
  {
    "numToStr/Comment.nvim",
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("Comment").setup({
        pre_hook = require(
          "ts_context_commentstring.integrations.comment_nvim"
        ).create_pre_hook(),
      })

      local opts = { noremap = false, desc = "Toggle Comment" }

      vim.api.nvim_set_keymap("n", "<C-_>", "gcc", opts)
      vim.api.nvim_set_keymap("v", "<C-_>", "gcc", opts)
    end,
  },
}
