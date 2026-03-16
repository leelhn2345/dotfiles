return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  opts = {
    formatters_by_ft = {
      javascript = { "biome" },
      typescript = { "biome" },
      javascriptreact = { "biome" },
      typescriptreact = { "biome" },
      css = { "biome" },
      scss = { "prettierd" },
      lua = { "stylua" },
      python = { "ruff_fix", "ruff_format" },
      sh = { "shfmt" },
      sql = { "sql_formatter" }, -- use `.sql-formatter.json` to configure
      cs = { "csharpier" },
      nix = { "nixfmt" },
      http = { "kulala-fmt" },
      handlebars = { "djlint" },
      xml = { "xmlformatter" },
    },
    formatters = {
      sql_formatter = {
        prepend_args = {
          "-c",
          '{"keywordCase":"upper", "tabWidth":4}',
        },
      },
    },
    format_on_save = {
      lsp_format = "fallback",
      timeout_ms = 500,
    },
  },
}
