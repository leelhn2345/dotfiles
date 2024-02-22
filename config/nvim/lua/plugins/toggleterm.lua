return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = "ToggleTerm",
  keys = {
    { "\\", ":ToggleTerm", desc = "Toggle Terminal" },
    { "<esc>", "<C-\\><C-n>", mode = "t" },
    { "<leader>\\", ":TermSelect<CR>", mode = "n", desc = "Select Terminal" },
  },
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return vim.o.lines * 0.3
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[\]],
    direction = "float",
    insert_mappings = false,
  },
}
