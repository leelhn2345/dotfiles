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
        {
          "marksman",
          dependencies = { "markdownlint-cli2" },
        },
        "json-lsp",
        {
          "bash-language-server",
          dependencies = { "shellcheck", "shfmt" },
        },
        {
          "vtsls",
          dependencies = {
            "js-debug-adapter",
            "prettierd",
          },
        },
        "eslint-lsp",
        "biome",
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
        { "sql-formatter", filetypes = { "sql" } },
        { "kulala-fmt", filetypes = { "http" } },
        { "codelldb", filetypes = { "rust" } },
        { "ty", dependencies = { "debugpy" } },
        "ruff",
        { "djlint", filetypes = { "handlebars" } },
        { "xmlformatter", filetypes = { "xml" } },
        "just-lsp",
        "jdtls",
      },
    },
  },
}
