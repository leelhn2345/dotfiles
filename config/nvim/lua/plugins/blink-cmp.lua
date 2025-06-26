return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
    {
      "Kaiser-Yang/blink-cmp-git",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  version = "*", -- use a release tag to download pre-built binaries
  opts = {
    keymap = {
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
      ["<CR>"] = { "select_and_accept", "fallback" },
    },
    appearance = {
      nerd_font_variant = "normal",
    },
    cmdline = {
      enabled = false,
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "dadbod", "git" },
      providers = {
        dadbod = {
          module = "vim_dadbod_completion.blink",
        },
        git = {
          -- only enable this source when filetype is gitcommit, markdown, or 'octo'
          enabled = function()
            return vim.tbl_contains(
              { "octo", "gitcommit", "markdown" },
              vim.bo.filetype
            )
          end,
          module = "blink-cmp-git",
          opts = {
            commit = {
              enable = false,
            },
          },
        },
      },
    },
    completion = {
      list = {
        selection = {
          auto_insert = false,
        },
      },
      menu = {
        border = "rounded",
        draw = {
          treesitter = { "lsp" },
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind" },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = "rounded",
        },
      },
    },
  },
}
