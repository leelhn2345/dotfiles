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
          -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
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

    -- configure csharp server
    -- lspconfig["omnisharp"].setup({
    --   capabilities = capabilities,
    --   on_attach = function(_, bufnr)
    --     local bufopts = {
    --       desc = "Show LSP definition",
    --       noremap = true,
    --       silent = true,
    --       buffer = bufnr,
    --     }
    --     vim.keymap.set("n", "gd", function()
    --       require("omnisharp_extended").lsp_definitions()
    --     end, bufopts)
    --   end,
    --   cmd = {
    --     vim.fn.expand("~/.local/share/nvim/mason/bin/omnisharp"),
    --     "--languageserver",
    --     "--hostPID",
    --     tostring(vim.fn.getpid()),
    --   },
    --   handlers = {
    --     ["textDocument/definition"] = require("omnisharp_extended").handler,
    --   },
    -- })
  end,
}
