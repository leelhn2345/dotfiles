return {
  {
    "rcarriga/nvim-notify",
    dependencies = {
      "ibhagwan/fzf-lua",
    },
    lazy = true, -- loads only when noice.nvim requires it
    keys = {
      {
        "<leader>fn",
        function()
          require("notify.integrations.fzf").open()
        end,
        desc = "Notification logs",
      },
    },
    opts = {
      background_color = "#000000",
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    keys = {
      {
        "<leader>nd",
        ":NoiceDismiss<CR>",
        silent = true,
        desc = "Dismiss notifications",
      },
    },
    opts = {
      -- disable write notification
      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
        hover = { silent = true },
      },
      presets = {
        -- bottom_search = true, -- use a classic bottom cmdline for search
        -- command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        -- inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
  },
}
