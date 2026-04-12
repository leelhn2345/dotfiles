return {
  "otavioschwanck/arrow.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = "VeryLazy",
  keys = {
    {
      "m",
      function()
        require("arrow.persist").toggle()
      end,
      desc = "Arrow File Mappings",
    },
    {
      "<C-p>",
      function()
        require("arrow.persist").previous()
      end,
      desc = "Prev Arrow Mark",
    },
    {
      "<C-n>",
      function()
        require("arrow.persist").next()
      end,
      desc = "Next Arrow Mark",
    },
  },
  opts = {
    show_icons = true,
    leader_key = "m", -- Recommended to be a single key
  },
}
