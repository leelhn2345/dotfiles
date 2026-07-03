return {
  "WilliamHsieh/overlook.nvim",
  keys = {
    { "gp", "", desc = "+peek" },
    {
      "gpd",
      function()
        require("overlook.api").peek_definition()
      end,
      desc = "Peek definition",
    },
    {
      "gP",
      function()
        require("overlook.api").close_all()
      end,
      desc = "Close all popup",
    },
    {
      "gpu",
      function()
        require("overlook.api").restore_popup()
      end,
      desc = "Restore popup",
    },
    {
      "gpU",
      function()
        require("overlook.api").restore_all_popups()
      end,
      desc = "Restore popup",
    },
    {
      "gps",
      function()
        require("overlook.api").open_in_split()
      end,
      desc = "Open popup in split",
    },
    {
      "gpv",
      function()
        require("overlook.api").open_in_vsplit()
      end,
      desc = "Open popup in vsplit",
    },
    {
      "gpo",
      function()
        require("overlook.api").open_in_original_window()
      end,
      desc = "Open popup in current window",
    },
  },
  opts = {},
}
