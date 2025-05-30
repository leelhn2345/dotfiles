return {
  -- Version Control
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- diff integration
    },
    cmd = { "Neogit" },
    keys = {
      {
        "gi",
        "<CMD>Neogit<CR>",
        desc = "Neogit (Git Info)",
        silent = true,
      },
    },
    opts = {
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
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "Octo",
    keys = {
      { "<leader>O", "<CMD>Octo<CR>", desc = "Octo" },
    },
    opts = {
      picker = "fzf-lua",
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
