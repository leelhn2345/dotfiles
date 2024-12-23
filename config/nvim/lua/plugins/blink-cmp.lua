return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  dependencies = { "rafamadriz/friendly-snippets" },
  -- use a release tag to download pre-built binaries
  -- BUG: v0.8.1 triggers cmp on prompt buffer. wait till v0.8.2 before update.
  version = "v0.8.0",
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
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "normal",
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "dadbod" },
      cmdline = {},
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
