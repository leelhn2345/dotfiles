return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  opts = {
    formatters_by_ft = {
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescriptreact = { "prettierd" },
      css = { "prettierd" },
      scss = { "prettierd" },
      html = { "prettierd" },
      json = { "prettierd" },
      jsonc = { "prettierd" },
      yaml = { "prettierd" },
      markdown = { "markdownlint-cli2" },
      lua = { "stylua" },
      python = { "ruff_fix", "ruff_format" },
      sh = { "shfmt" },
      sql = { "sql_formatter" }, -- use `.sql-formatter.json` to configure
      cs = { "csharpier" },
      go = { "goimports-reviser", "gofumpt", "golines" },
      nix = { "nixfmt" },
      http = { "kulala-fmt" },
      handlebars = { "djlint" },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    },
  },
}
