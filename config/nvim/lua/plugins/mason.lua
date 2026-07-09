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
    lazy = true,
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      automatic_enable = {
        exclude = {
          -- i want to decide the order the lsp is attached to.
          "ruff",
          "ty",
          --
          "yamlls", -- yaml-companion,
          "jdtls",
          "oxfmt",
        },
      },
    },
  },
  {
    "owallb/mason-auto-install.nvim",
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    opts = {
      packages = {
        "lua-language-server",
        "stylua",
        "rumdl",
        "json-lsp",
        "yaml-language-server",
        {
          "bash-language-server",
          dependencies = { "shellcheck", "shfmt" },
        },
        {
          "tsgo",
          dependencies = {
            "js-debug-adapter",
          },
        },
        "eslint-lsp",
        "oxlint",
        "oxfmt",
        "tailwindcss-language-server",
        "emmet-language-server",
        "css-lsp",
        "html-lsp",
        {
          "omnisharp", -- :MasonInstall --target=darwin_arm64 omnisharp
          dependencies = { "csharpier" },
        },
        "tombi",
        "gopls",
        "tinymist",
        "terraform-ls",
        {
          "nomicfoundation-solidity-language-server",
          dependencies = { "solhint" },
        },
        { "hadolint", filetypes = { "dockerfile" } },
        { "kulala-fmt", filetypes = { "http" } },
        { "codelldb", filetypes = { "rust" } },
        { "ty", dependencies = { "debugpy" } },
        "ruff",
        { "djlint", filetypes = { "handlebars" } },
        "lemminx",
        "just-lsp",
        "jdtls",
        "sql-formatter",
      },
    },
  },
}
