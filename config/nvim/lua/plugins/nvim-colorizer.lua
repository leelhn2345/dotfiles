return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    user_default_options = {
      mode = "virtualtext",
      virtualtext_inline = true,
      tailwind = true,
    },
  },
}
