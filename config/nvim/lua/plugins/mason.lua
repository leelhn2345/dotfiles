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
        "omnisharp",
        "gopls",
        "tinymist",
      },
      automatic_installation = true,
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
        "markdownlint",
        "shellcheck",
        "hadolint",
        "golangci-lint",

        -- formatter
        "stylua",
        "prettierd",
        "shfmt",
        "sql-formatter",
        "csharpier",
        "goimports-reviser",
        "gofumpt",
        "golines",
      },
    },
  },
}
