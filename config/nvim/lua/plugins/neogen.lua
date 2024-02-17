return {
  "danymat/neogen",
  event = "VeryLazy",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    require("neogen").setup()

    local opts = { silent = true, desc = "Generate Docstring" }

    vim.api.nvim_set_keymap(
      "n",
      '""',
      ":lua require('neogen').generate()<CR>",
      opts
    )
  end,
}
