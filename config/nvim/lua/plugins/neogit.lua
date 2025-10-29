return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- diff integration
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
    integrations = {
      diffview = true,
    },
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
