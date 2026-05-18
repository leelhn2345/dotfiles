local prefix = "<leader>K"

return {
  "mistweaverco/kulala.nvim",
  ft = { "http" },

  -- NOTE: main branch doesnt have treesitter fixes yet.
  branch = "develop",

  keys = {
    { prefix, "", desc = "+Kulala", mode = { "n", "v" } },
  },

  opts = {
    global_keymaps = true,
    global_keymaps_prefix = prefix,
  },
}
