return {
  "neovim/nvim-lspconfig",
  init = function()
    local lspConfigPath = require("lazy.core.config").options.root
      .. "/nvim-lspconfig"
    vim.opt.runtimepath:append(lspConfigPath)

    vim.api.nvim_create_user_command("LspInfo", function()
      vim.cmd("checkhealth vim.lsp")
    end, { desc = "LSP Information" })
  end,
}
