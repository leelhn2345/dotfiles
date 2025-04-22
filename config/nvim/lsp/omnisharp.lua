return {
  on_attach = function(_, bufnr)
    local bufopts = {
      desc = "Show LSP definition",
      noremap = true,
      silent = true,
      buffer = bufnr,
    }
    vim.keymap.set("n", "gd", function()
      require("omnisharp_extended").lsp_definitions()
    end, bufopts)
  end,
  handlers = {
    ["textDocument/definition"] = require("omnisharp_extended").handler,
  },
}
