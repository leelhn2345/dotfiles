return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      default_component_configs = {
        indent = {
          with_expanders = true,
        },
        git_status = {
          symbols = {
            ignored = "",
          },
        },
      },
      filesystem = {
        hijack_netrw_behavior = "open_current",
        follow_current_file = {
          enabled = true,
        },
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          -- don't risk messing with git config
          never_show = { ".git" },
        },
      },
    })

    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    opts.desc = "Focus File Explorer"
    keymap.set("n", "<leader>em", ":Neotree focus<CR>", opts)

    opts.desc = "Toggle File Explorer"
    keymap.set("n", "<leader>ee", ":Neotree toggle<CR>", opts)
  end,
}
