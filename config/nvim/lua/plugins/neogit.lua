return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "esmuellert/codediff.nvim", -- diff integration
  },
  cmd = { "Neogit" },
  keys = {
    {
      "gi",
      "<CMD>Neogit<CR>",
      desc = "Neogit (Git Info)",
      silent = true,
    },
  },
  opts = {
    status = {
      recent_commit_count = 50,
    },
    commit_editor = {
      kind = "auto",
      show_staged_diff = false,
    },
    graph_style = "unicode",
    mappings = {
      finder = {
        ["<c-j>"] = "Next",
        ["<c-k>"] = "Previous",
      },
    },
  },
}
