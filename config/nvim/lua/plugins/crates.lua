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
      on_attach = function(_, bufnr)
        vim.keymap.set("n", "<leader>cf", function()
          require("crates").show_features_popup()
        end, { buffer = bufnr, desc = "Crates: Show Features" })
      end,
    },
  },
}
