return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  config = function()
    local blame_format = "  <author> • <author_time:%d %b %Y> • <summary>"
    -- local blame_format =
    --   "  <author> • <author_time:%a %d %b %Y %H:%M:%S> <author_tz> • <summary>"

    require("gitsigns").setup({
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 0,
        ignore_whitespace = true,
        virt_text_priority = 1024,
      },
      current_line_blame_formatter = blame_format,
    })
  end,
}
