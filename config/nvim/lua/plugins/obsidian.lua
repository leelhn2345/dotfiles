return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  dependencies = { "ibhagwan/fzf-lua" },
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
    {
      "<leader>ob",
      "<CMD>Obsidian backlinks<CR>",
      desc = "Obsidian backlinks",
    },
    {
      "<leader>on",
      ":Obsidian extract_note<CR>",
      desc = "Obsidian extract note",
      mode = { "x" },
      silent = true,
    },
    {
      "<leader>oc",
      "<CMD>Obsidian toggle_checkbox<CR>",
      desc = "Obsidian toggle checkbox",
      mode = { "n" },
    },
    {
      "<leader>oc",
      ":Obsidian toggle_checkbox<CR>gv",
      desc = "Obsidian toggle checkbox",
      mode = { "x" },
      silent = true,
    },
  },
  opts = function()
    return {
      legacy_commands = false, -- this will be removed in 4.0.0
      note_id_func = require("obsidian.builtin").title_id,
      workspaces = {
        {
          -- docs: https://obsidian.md/help/sync/headless
          -- run till `ob sync`
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
      -- footer = { enabled = false }, -- reduce rg calls, which are slow for large vaults
      -- search = { sort = false }, -- avoid rg sorting, which is slow for large vaults
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
