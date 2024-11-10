return {
  "rmagatti/auto-session",
  -- can't be VeryLazy
  -- Mason can't be VeryLazy as well due to LSP on 1st file read
  init = function()
    vim.o.sessionoptions =
      "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
  end,
  config = function()
    require("auto-session").setup({
      auto_session_allowed_dirs = {
        "~/code/*",
        -- "~/dotfiles",
        "~/dotfiles/config/nvim",
        "/data/*",
      },
      pre_save_cmds = {
        "Neotree close",
        "lua require('trouble').close()",
        "lua require('neogit').close()",
        "lua require('spectre').close()",
        "DBUIClose",
      },
      bypass_session_save_file_types = {
        "",
        "no-neck-pain",
        "noice",
      },
    })
  end,
}
