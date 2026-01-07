return {
  "rmagatti/auto-session",
  -- can't be VeryLazy
  -- Mason can't be VeryLazy as well due to LSP on 1st file read
  init = function()
    vim.o.sessionoptions =
      "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

    -- vim.api.nvim_create_user_command("Session", "AutoSession <args>", {
    --   nargs = "*",
    --   complete = function(arg_lead)
    --     return vim.fn.getcompletion("AutoSession " .. arg_lead, "cmdline")
    --   end,
    -- })
  end,
  opts = {
    -- only automatically create new session files
    -- inside of git projects
    auto_create = function()
      local cmd = "git rev-parse --is-inside-work-tree"
      return vim.fn.system(cmd) == "true\n"
    end,
    -- allowed_dirs = {
    --   "~/code/*",
    --   -- "~/dotfiles",
    --   "~/dotfiles/config/nvim",
    --   "/data/*",
    -- },
    purge_after_minutes = 14400,
    bypass_save_file_types = {
      "",
    },
    close_filetypes_on_save = {
      "checkhealth",
      "no-neck-pain", -- BUG: https://github.com/shortcuts/no-neck-pain.nvim/issues/500
      "noice",
      "typst",
      "kulala_ui.json",
      "snacks_terminal",
      "leetcode.nvim",
    },
    pre_save_cmds = {
      -- "Neotree close",
      "lua require('trouble').close()",
      "lua require('neogit').close()",
      "bd kulala://ui",
    },
    -- legacy_cmds = false,
  },
}
