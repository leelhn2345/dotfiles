return {
  {
    "mason-org/mason.nvim",
    lazy = true,
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
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
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
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
