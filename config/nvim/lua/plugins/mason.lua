return {
  {
    "williamboman/mason.nvim",
    lazy = true,
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "eslint",
        "vtsls",
        "cssls",
        "html",
        "jsonls",
        "lua_ls",
        "basedpyright",
        "ruff",
        -- "rust_analyzer",
        "yamlls",
        "taplo",
        "marksman",
        "bashls",
        "tailwindcss",
        "emmet_language_server",
        "omnisharp", -- :MasonInstall --target=darwin_arm64 omnisharp
        "gopls",
        "tinymist",
      },
      automatic_installation = true,
      handlers = {
        function(server)
          vim.lsp.enable(server)
        end,
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        -- dap
        "debugpy", -- python
        "js-debug-adapter", -- nodejs
        "codelldb", -- rust

        -- linter
        -- "mypy",
        "markdownlint-cli2",
        "shellcheck",
        "hadolint",
        "djlint",

        -- formatter
        "stylua",
        "prettierd",
        "shfmt",
        "sql-formatter",
        "csharpier",
        "kulala-fmt",
      },
    },
  },
}
