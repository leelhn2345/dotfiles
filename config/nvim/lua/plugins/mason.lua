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
        "ruff_lsp",
        "rust_analyzer",
        "yamlls",
        "taplo",
        "marksman",
        "bashls",
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
        "markdownlint",
        "shellcheck",
        "hadolint",

        -- formatter
        "stylua",
        "prettierd",
        "shfmt",
        "sql-formatter",
      },
    },
  },
}
