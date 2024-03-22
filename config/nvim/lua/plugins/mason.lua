return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },

  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
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
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_tool_installer.setup({
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
    })
  end,
}
