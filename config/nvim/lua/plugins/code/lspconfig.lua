return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "saghen/blink.cmp",
    "SmiteshP/nvim-navbuddy",
    "b0o/schemastore.nvim",
    "Hoffs/omnisharp-extended-lsp.nvim",
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = require("blink.cmp").get_lsp_capabilities()

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
            -- using mypy for type-checking
            typeCheckingMode = "basic",
          },
        },
      },
    })

    -- configure ruff server
    lspconfig["ruff"].setup({
      capabilities = capabilities,
    })

    -- configure csharp server
    lspconfig["omnisharp"].setup({
      capabilities = capabilities,
      on_attach = function(_, bufnr)
        local bufopts = {
          desc = "Show LSP definition",
          noremap = true,
          silent = true,
          buffer = bufnr,
        }
        vim.keymap.set("n", "gd", function()
          require("omnisharp_extended").telescope_lsp_definitions()
        end, bufopts)
      end,
      cmd = {
        vim.fn.expand("~/.local/share/nvim/mason/bin/omnisharp"),
        "--languageserver",
        "--hostPID",
        tostring(vim.fn.getpid()),
      },
      handlers = {
        ["textDocument/definition"] = require("omnisharp_extended").handler,
      },
    })

    -- configure go server
    lspconfig["gopls"].setup({
      capabilities = capabilities,
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
      on_attach = function(_, bufnr)
        local bufopts = {
          noremap = true,
          silent = true,
          buffer = bufnr,
          desc = "Show crate popup",
        }
        vim.keymap.set("n", "K", function()
          if
            vim.fn.expand("%:t") == "Cargo.toml"
            and require("crates").popup_available()
          then
            require("crates").show_popup()
          else
            vim.lsp.buf.hover()
          end
        end, bufopts)
      end,
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
