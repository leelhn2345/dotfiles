return {
  "pwntester/octo.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Octo",
  keys = {
    { "<leader>O", "<CMD>Octo<CR>", desc = "Octo" },
  },
  opts = {
    picker = "fzf-lua",
    default_merge_method = "squash",
    default_delete_branch = true,
    enable_builtin = true,
    suppress_missing_scope = {
      projects_v2 = true,
    },
  },
  config = function(_, opts)
    require("octo").setup(opts)
    vim.treesitter.language.register("markdown", "octo")
  end,
}
