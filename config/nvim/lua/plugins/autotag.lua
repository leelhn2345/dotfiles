return {
  "windwp/nvim-ts-autotag",
  opts = {
    opts = {
      enable_close_on_slash = true,
    },
  },
  event = { "BufReadPre", "BufNewFile" },
}
