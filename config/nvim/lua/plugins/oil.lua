return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = true,
  cmd = "Oil",
  keys = {
    { "-", ":Oil --float<CR>", desc = "Open parent directory", silent = true },
  },
  opts = {
    keymaps = {
      ["q"] = { "actions.close", mode = "n" },
    },
    skip_confirm_for_simple_edits = true,
    win_options = {
      wrap = true,
    },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        return name == ".git"
      end,
    },
    float = {
      max_width = 90,
      border = "rounded",
    },
    confirmation = {
      border = "rounded",
    },
  },
}
