return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    {
      "kristijanhusak/vim-dadbod-completion",
      lazy = true,
    },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  keys = {
    {
      "<leader>du",
      ":DBUIToggle<CR>",
      desc = "Database UI",
      silent = true,
    },
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}
