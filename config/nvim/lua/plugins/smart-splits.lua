return {
  "mrjones2014/smart-splits.nvim",
  event = "VeryLazy",
  config = function()
    local smartSplits = require("smart-splits")

    smartSplits.setup({ default_amount = 5 })

    local keymap = vim.keymap
    local opts = { silent = true }

    opts.desc = "Resize leftwards"
    keymap.set("n", "<A-h>", smartSplits.resize_left, opts)

    opts.desc = "Resize downwards"
    keymap.set("n", "<A-j>", smartSplits.resize_down, opts)

    opts.desc = "Resize upwards"
    keymap.set("n", "<A-k>", smartSplits.resize_up, opts)

    opts.desc = "Resize rightwards"
    keymap.set("n", "<A-l>", smartSplits.resize_right, opts)

    opts.desc = "Go left pane"
    keymap.set("n", "<C-h>", smartSplits.move_cursor_left, opts)

    opts.desc = "Go bottom pane"
    keymap.set("n", "<C-j>", smartSplits.move_cursor_down, opts)

    opts.desc = "Go top pane"
    keymap.set("n", "<C-k>", smartSplits.move_cursor_up, opts)

    opts.desc = "Go right pane"
    keymap.set("n", "<C-l>", smartSplits.move_cursor_right, opts)
  end,
}
