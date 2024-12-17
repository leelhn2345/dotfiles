return {
  "saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  opts = {
    popup = {
      autofocus = true,
      border = "rounded",
    },
    completion = {
      crates = {
        enabled = true,
      },
    },
    lsp = {
      enabled = true,
      actions = true,
      completion = true,
      hover = true,
    },
  },
}
