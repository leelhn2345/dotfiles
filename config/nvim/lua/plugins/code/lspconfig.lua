return {
  "neovim/nvim-lspconfig",
  init = function()
    local lspConfigPath = require("lazy.core.config").options.root
      .. "/nvim-lspconfig"
    vim.opt.runtimepath:append(lspConfigPath)
  end,
}
