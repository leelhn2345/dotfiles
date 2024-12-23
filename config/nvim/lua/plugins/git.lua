return {
  -- Version Control
  {
    "NeogitOrg/neogit",
    cmd = { "Neogit" },
    dependencies = {
      "nvim-telescope/telescope.nvim", -- preferred
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- diff integration
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
      process_spinner = false,
      graph_style = "unicode",
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
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim", -- preferred
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      default_merge_method = "squash",
      default_delete_branch = true,
      enable_builtin = true,
      suppress_missing_scope = {
        projects_v2 = true,
      },
    },
    config = function(_, opts)
      require("octo").setup(opts)
      vim.treesitter.language.register("markdown", "octo")
    end,
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
