return {
  "chrisgrieser/nvim-origami",
  event = "VeryLazy",
  dependencies = {
    "lewis6991/gitsigns.nvim",
  },
  -- recommended: disable vim's auto-folding
  init = function()
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99
  end,
  opts = {
    foldtext = {
      lineCount = {
        template = "󰁂 %d lines", -- `%d` is replaced with the number of folded lines
      },
    },
    foldKeymaps = {
      setup = false, -- modifies `h` and `l`
    },
  },
}
