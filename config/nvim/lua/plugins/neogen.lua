return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  keys = {
    {
      '""',
      ":lua require('neogen').generate()<CR>",
      desc = "Generate Docstring",
      silent = true,
    },
  },
  opts = {},
}
