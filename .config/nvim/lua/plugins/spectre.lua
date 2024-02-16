return {
  "nvim-pack/nvim-spectre",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = true,
  cmd = { "Spectre" },
  keys = {
    {
      "<leader>S",
      '<cmd>lua require("spectre").toggle()<CR>',
      desc = "Toggle Spectre",
    },
    {
      "<leader>sw",
      '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
      desc = "Search current word",
    },
    {
      "<leader>sw",
      '<cmd>lua require("spectre").toggle()<CR>',
      mode = "v",
      desc = "Search current word",
    },
    {
      "<leader>sf",
      '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
      desc = "Search on current file",
    },
  },
  config = function()
    require("spectre").setup({
      mapping = {
        ["quit"] = {
          map = "q",
          cmd = '<cmd>lua require("spectre").close()<CR>',
          desc = "quit spectre",
        },
      },
    })
  end,
}
