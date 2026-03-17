return {
  "Bekaboo/dropbar.nvim",
  opts = {
    -- https://github.com/Bekaboo/dropbar.nvim?tab=readme-ov-file#bar
    bar = {
      sources = function(buf, _)
        local sources = require("dropbar.sources")
        local utils = require("dropbar.utils")

        local bufname = vim.api.nvim_buf_get_name(buf)

        if vim.startswith(bufname, "jdt://") then
          return {
            utils.source.fallback({
              sources.lsp,
              sources.treesitter,
            }),
          }
        end

        if vim.bo[buf].ft == "markdown" then
          return {
            sources.path,
            sources.markdown,
          }
        end
        if vim.bo[buf].buftype == "terminal" then
          return {
            sources.terminal,
          }
        end
        return {
          sources.path,
          utils.source.fallback({
            sources.lsp,
            sources.treesitter,
          }),
        }
      end,
    },
    symbol = {
      on_click = false,
    },
    icons = {
      kinds = {
        dir_icon = "",
      },
    },
    -- sources = {
    --   path = {
    --     max_depth = 4,
    --   },
    -- },
  },
}
