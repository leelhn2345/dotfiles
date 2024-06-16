return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "SmiteshP/nvim-navbuddy",
    "b0o/schemastore.nvim",
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- configure html server
    lspconfig["html"].setup({
      capabilities = capabilities,
    })

    -- configure emmet server
    lspconfig["emmet_language_server"].setup({
      capabilities = capabilities,
      filetypes = {
        "html",
        "htmldjango",
        "pug",
      },
    })

    -- configure tailwindcss server
    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
    })

    -- configure typescript server
    lspconfig["vtsls"].setup({
      capabilities = capabilities,
    })

    -- configure eslint server
    lspconfig["eslint"].setup({
      capabilities = capabilities,
    })

    -- configure css server
    lspconfig["cssls"].setup({
      capabilities = capabilities,
      settings = {
        css = {
          lint = {
            unknownAtRules = "ignore",
          },
        },
      },
    })

    -- configure python server
    lspconfig["basedpyright"].setup({
      capabilities = capabilities,
      settings = {
        basedpyright = {
          analysis = {
            typeCheckingMode = "standard",
          },
        },
      },
    })

    -- configure ruff server
    lspconfig["ruff"].setup({
      capabilities = capabilities,
    })

    -- configure csharp server
    local pid = vim.fn.getpid()
    -- needs to change path depending on host
    local omnisharp = "/home/nelson/.local/share/nvim/mason/bin/omnisharp"
    lspconfig["omnisharp"].setup({
      capabilities = capabilities,
      cmd = { omnisharp, "--languageserver", "--hostPID", tostring(pid) },
    })

    -- configure json server
    lspconfig["jsonls"].setup({
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })

    -- configure toml server
    lspconfig["taplo"].setup({
      capabilities = capabilities,
    })

    -- configure yaml server
    lspconfig["yamlls"].setup({
      capabilities = capabilities,
    })

    -- configure markdown server
    lspconfig["marksman"].setup({
      capabilities = capabilities,
    })

    -- configure bash server
    lspconfig["bashls"].setup({
      capabilities = capabilities,
    })

    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}
