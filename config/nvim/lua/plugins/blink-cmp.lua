return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  dependencies = { "rafamadriz/friendly-snippets" },
  -- use a release tag to download pre-built binaries
  version = "v0.*",
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
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    sources = {
      completion = {
        enabled_providers = {
          "lsp",
          "path",
          "snippets",
          "buffer",
          "dadbod",
        },
      },
      providers = {
        dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
      },
    },
    completion = {
      -- experimental auto-brackets support
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        draw = {
          treesitter = { "lsp" },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
    },
  },
}
