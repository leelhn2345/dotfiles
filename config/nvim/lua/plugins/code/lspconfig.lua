return {
  "neovim/nvim-lspconfig",
  init = function()
    local lspConfigPath = require("lazy.core.config").options.root
      .. "/nvim-lspconfig"
    vim.opt.runtimepath:append(lspConfigPath)

    vim.api.nvim_create_user_command("LspInfo", function()
      vim.cmd("checkhealth vim.lsp")
    end, { desc = "LSP Information" })

    vim.api.nvim_create_user_command("LspRestart", "lsp restart", {
      desc = "Restart LSP",
    })

    vim.api.nvim_create_user_command("LspLog", function(_)
      local state_path = vim.fn.stdpath("state")
      local log_path = vim.fs.joinpath(state_path, "lsp.log")

      vim.cmd(string.format("tabedit %s", log_path))
    end, {
      desc = "Show LSP log",
    })
  end,
}
