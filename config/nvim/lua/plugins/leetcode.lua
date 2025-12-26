return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  cmd = "Leet",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ibhagwan/fzf-lua",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    lang = "python3",
    picker = { provider = "fzf-lua" },
    keys = {
      reset_testcases = "R",
    },
    injector = {
      ["python3"] = {
        imports = {},
      },
    },
  },
}
