return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "SmiteshP/nvim-navbuddy",
  },
  opts = {},
  config = function(_, _)
    vim.lsp.config("*", {
      capabilities = {
        textDocument = {
          -- Tell the server the capability of foldingRange,
          -- Neovim hasn't added foldingRange to default capabilities,
          -- users must add it manually
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
          },
        },
      },
    })

    local lsp_path = vim.fn.stdpath("config") .. "/lsp"

    local servers = {}

    for _, file in ipairs(vim.fn.readdir(lsp_path)) do
      if file:match("%.lua$") then
        local server = file:gsub("%.lua$", "")
        table.insert(servers, server)
      end
    end

    vim.lsp.enable(servers)
  end,
}
