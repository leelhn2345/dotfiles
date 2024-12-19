return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "MeanderingProgrammer/render-markdown.nvim",
  },
  keys = {
    { "<leader>ff", ":FzfLua files<CR>", silent = true, desc = "Find files" },
    { "<leader>fh", ":FzfLua helptags<CR>", silent = true, desc = "Help tags" },
    { "<leader>fa", ":FzfLua<CR>", silent = true, desc = "Help tags" },
    {
      "<leader>fg",
      ":FzfLua live_grep<CR>",
      silent = true,
      desc = "Live grep",
    },
    { "<leader>fK", ":FzfLua keymaps<CR>", silent = true, desc = "Keymaps" },
    { "<leader>fb", ":FzfLua buffers<CR>", silent = true, desc = "Buffers" },
  },
  opts = {
    winopts = {
      preview = {
        horizontal = "right:45%",
        winopts = { number = false },
      },
    },
    keymap = {
      builtin = {
        ["<C-u>"] = "preview-page-up",
        ["<C-d>"] = "preview-page-down",
      },
    },
    fzf_opts = {
      ["--layout"] = "default",
    },
    files = {
      cwd_prompt = false,
      actions = false,
      git_icons = false,
    },
    grep = { actions = false },
    lsp = {
      code_actions = {
        previewer = "codeaction_native",
        preview_pager = "delta --width=$FZF_PREVIEW_COLUMNS --hunk-header-style='omit' --file-style='omit'",
      },
    },
  },
}
