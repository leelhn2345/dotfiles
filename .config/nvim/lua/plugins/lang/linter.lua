return {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      python = { "mypy" },
      markdown = { "markdownlint" },
      dockerfile = { "hadolint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    -- trigger linting on various vim events
    -- check out `:h event` to know the various events
    vim.api.nvim_create_autocmd(
      { "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" },
      {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      }
    )
  end,
}
