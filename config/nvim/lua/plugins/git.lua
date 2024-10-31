return {
  -- Version Control
  {
    "NeogitOrg/neogit",
    cmd = { "Neogit" },
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
    },
    keys = {
      {
        "gi",
        ":Neogit<CR>",
        desc = "Neogit (Git Info)",
        silent = true,
      },
    },
    opts = {
      console_timeout = 5000,
      integrations = {
        diffview = true,
      },
      status = {
        recent_commit_count = 50,
      },
      commit_editor = {
        kind = "auto",
        show_staged_diff = false,
      },
      mappings = {
        finder = {
          ["<c-j>"] = "Next",
          ["<c-k>"] = "Previous",
        },
      },
    },
  },

  -- Github pull requests
  {
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      enable_builtin = true,
    },
    keys = {
      { "<leader>O", ":Octo<CR>", desc = "Octo", silent = true },
    },
  },

  -- Git Blame
  {
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
          virt_text_priority = 5000,
        },
        current_line_blame_formatter = blame_format,
      })
    end,
  },
}
