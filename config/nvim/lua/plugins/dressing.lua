return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  opts = {
    select = {
      -- Priority list of preferred vim.select implementations
      backend = { "fzf_lua", "fzf", "telescope", "builtin", "nui" },
    },
  },
}
