return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  opts = {
    formatters = {
      sql_formatter = {
        args = {
          "-l",
          "postgresql",
          "-c", -- use json string for config
          '{\
            "keywordCase": "upper"\
          }',
        },
      },
    },
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
      markdown = { "markdownlint" },
      lua = { "stylua" },
      python = { "ruff", "ruff_format" },
      sh = { "shfmt" },
      sql = { "sql_formatter" },
      cs = { "csharpier" },
      go = { "goimports-reviser", "gofumpt", "golines" },
      ["_"] = { "trim_whitespace" },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    },
  },
}
