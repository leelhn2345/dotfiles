return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "saghen/blink.cmp",
    "SmiteshP/nvim-navbuddy",
    "b0o/schemastore.nvim",
    "Hoffs/omnisharp-extended-lsp.nvim",
  },
  opts = {
    servers = {
      html = {},
      emmet_language_server = {
        filetypes = {
          "html",
          "htmldjango",
          "pug",
        },
      },
      tailwindcss = {},
      vtsls = {
        settings = {
          typescript = {
            updateImportsOnFileMove = {
              enabled = "always",
            },
          },
        },
      },
      eslint = {},
      cssls = {
        settings = {
          css = {
            lint = {
              unknownAtRules = "ignore",
            },
          },
        },
      },
      basedpyright = {
        settings = {
          basedpyright = {
            analysis = {
              -- using mypy for type-checking
              typeCheckingMode = "basic",
            },
          },
        },
      },
      ruff = {},
      gopls = {},
      taplo = {},
      yamlls = {},
      marksman = {},
      bashls = {},
      lua_ls = {
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
      },
      tinymist = {
        settings = {
          formatterMode = "typstfmt",
          exportPdf = "onType",
          outputPath = "$root/target/$dir/$name",
        },
        on_attach = function(_, bufnr)
          vim.keymap.set(
            "n",
            "<leader>tp",
            "<cmd>TypstPreview<CR>",
            { desc = "Typst preview", buffer = bufnr }
          )
        end,
      },
    },
  },
  config = function(_, opts)
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- Tell the server the capability of foldingRange,
    -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    for server, config in pairs(opts.servers) do
      config.capabilities = capabilities
      lspconfig[server].setup(config)
    end

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
          require("omnisharp_extended").lsp_definitions()
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
  end,
}
