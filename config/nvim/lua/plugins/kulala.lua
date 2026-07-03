local prefix = "<leader>K"

return {
  "mistweaverco/kulala.nvim",
  ft = { "http" },
  keys = {
    { prefix, "", desc = "+Kulala", mode = { "n", "v" } },
  },
  opts = {
    global_keymaps = true,
    global_keymaps_prefix = prefix,
    kulala_keymaps = {
      ["Previous tab"] = false,
      ["Next tab"] = false,
    },
  },
}
