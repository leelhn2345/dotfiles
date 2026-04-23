return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  opts = function()
    local formatters_by_ft = {
      javascript = { "biome" },
      typescript = { "biome" },
      javascriptreact = { "biome" },
      typescriptreact = { "biome" },
      css = { "biome" },
      scss = { "prettierd" },
      lua = { "stylua" },
      python = { "ruff_fix", "ruff_format" },
      sh = { "shfmt" },
      zsh = { "shfmt" },
      cs = { "csharpier" },
      http = { "kulala-fmt" },
      handlebars = { "djlint" },
    }

    if vim.fn.executable("nixfmt") == 1 then
      formatters_by_ft.nix = { "nixfmt" }
    end

    return {
      formatters_by_ft = formatters_by_ft,
      format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 500,
      },
    }
  end,
}
