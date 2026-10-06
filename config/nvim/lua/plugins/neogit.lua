return {
  "NeogitOrg/neogit",
  dependencies = {
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
  -- ISSUE: https://github.com/NeogitOrg/neogit/issues/2008
  init = function()
    -- Shim codediff.ui.view.create for legacy Neogit integration schema
    local ok, view = pcall(require, "codediff.ui.view")
    if ok and view.create then
      local original_create = view.create
      local path = require("codediff.core.path")

      view.create = function(session_config, filetype, on_ready)
        if session_config.mode == "explorer" and not session_config.panel then
          session_config.panel = {
            name = "explorer",
            data = session_config.explorer_data or {},
          }
          session_config.original = session_config.original or path.empty()
          session_config.modified = session_config.modified or path.empty()
        end
        return original_create(session_config, filetype, on_ready)
      end
    end
  end,
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
