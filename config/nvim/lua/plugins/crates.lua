return {
  "saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local crates = require("crates")
    crates.setup({
      popup = {
        autofocus = true,
        border = "rounded",
      },
      on_attach = function(bufnr)
        vim.keymap.set(
          "n",
          "<leader>cp",
          crates.show_popup,
          { silent = true, desc = "Show crate popup", buffer = bufnr }
        )
      end,
    })
  end,
}
