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
    {
      "<leader>of",
      "<CMD>Obsidian quick_switch<CR>",
      desc = "Obsidian find files",
    },
    { "<leader>og", "<CMD>Obsidian search<CR>", desc = "Obsidian grep" },
    {
      "<leader>ow",
      "<CMD>Obsidian workspace<CR>",
      desc = "Obsidian workspace",
    },
    { "<leader>on", "<CMD>Obsidian new<CR>", desc = "Obsidian new note" },
    { "<leader>od", "<CMD>Obsidian dailies<CR>", desc = "Obsidian dailies" },
  },
  opts = function()
    return {
      legacy_commands = false, -- this will be removed in 4.0.0
      note_id_func = require("obsidian.builtin").title_id,
      workspaces = {
        {
          name = "notes",
          path = "~/vaults/notes",
        },
        -- {
        --   name = "local",
        --   path = "~/vaults/local",
        -- },
      },
      ui = { enable = false },
      picker = {
        name = "fzf-lua",
      },
      daily_notes = {
        folder = "calendar",
        workdays_only = false,
      },
      templates = {
        folder = "templates",
      },
      sync = {
        enabled = true,
      },
      frontmatter = {
        func = function(note)
          local out = {
            aliases = note.aliases,
            tags = note.tags,
          }

          if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
            for k, v in pairs(note.metadata) do
              out[k] = v
            end
          end

          return out
        end,
        sort = { "aliases", "tags" },
      },
    }
  end,
}
