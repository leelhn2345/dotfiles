return {
  "folke/trouble.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      "<leader>q",
      ":Trouble diagnostics toggle<CR>",
      desc = "Diagnostics (Trouble)",
      silent = true,
    },
  },
  opts = {
    -- auto_close = true,
    focus = true,
    keys = {
      m = { -- example of a custom action that toggles the active view filter
        action = function(view)
          view.state.filter_buffer = not view.state.filter_buffer
          view:filter(view.state.filter_buffer and { buf = 0 } or nil)
        end,
        desc = "Toggle Current Buffer Filter",
      },
    },
  },
}
