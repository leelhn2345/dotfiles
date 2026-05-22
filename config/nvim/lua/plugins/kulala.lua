local prefix = "<leader>K"

return {
  "mistweaverco/kulala.nvim",
  ft = { "http" },
  keys = {
    { prefix, "", desc = "+Kulala", mode = { "n", "v" } },
  },
  opts = {
    default_env = "dev",
    global_keymaps = true,
    global_keymaps_prefix = prefix,
  },
}
