return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = "ToggleTerm",
  keys = {
    { "\\", ":ToggleTerm", desc = "Toggle Terminal" },
    {
      "<leader>\\",
      "<CMD>TermSelect<CR>",
      mode = "n",
      desc = "Select Terminal",
    },
  },
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return vim.o.lines * 0.3
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[\]],
    direction = "float",
    insert_mappings = false,
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "toggleterm",
      callback = function()
        -- local escape_timer = nil
        vim.keymap.set(
          "t",
          "<esc>",
          "<C-\\><C-n>",
          -- function()
          --   if escape_timer then
          --     vim.fn.timer_stop(escape_timer)
          --     escape_timer = nil
          --     vim.cmd("stopinsert")
          --   else
          --     escape_timer = vim.fn.timer_start(
          --       200, -- 200 milliseconds
          --       function()
          --         escape_timer = nil
          --         vim.api.nvim_feedkeys(vim.keycode("<Esc>"), "n", false)
          --       end
          --     )
          --   end
          -- end,
          {
            buffer = true,
            silent = true,
            desc = "Escape to normal mode",
          }
        )
      end,
    })
  end,
}
