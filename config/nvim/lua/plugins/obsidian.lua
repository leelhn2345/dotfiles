return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/vault*/**.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/vault*/**.md",
  },
  keys = {
    { "<leader>o", "", desc = "+obsidian", mode = { "n", "v" } },
    { "<leader>oa", "<CMD>Obsidian<CR>", desc = "Obsidian commands" },
    { "<leader>ot", "<CMD>Obsidian tags<CR>", desc = "Obsidian tags" },
  },
  opts = {
    legacy_commands = false, -- this will be removed in 4.0.0
    workspaces = {
      {
        name = "notes",
        path = "~/vaults/notes",
      },
    },
    ui = { enable = false },
    picker = {
      name = "fzf-lua",
    },
    daily_notes = {
      folder = "daily-notes",
      workdays_only = false,
    },
    templates = {
      folder = "templates",
    },
  },
}
