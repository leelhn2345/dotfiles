return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
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
    opts = {
      ensure_installed = {
        "markdownlint", -- md formatter + linter
        "prettierd", -- prettier linter
        "stylua", -- lua formatter
        "debugpy", -- python debugger
        "js-debug-adapter", -- nodejs debugger
        "codelldb", -- rust debugger
        "shellcheck", -- bash linter
        "shfmt", -- bash formatter
        "hadolint", -- dockerfile linter
        "sql-formatter", -- sql formatter
      },
    },
  },
}
