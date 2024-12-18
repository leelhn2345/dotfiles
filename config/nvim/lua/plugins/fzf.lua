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
      width = 0.8,
      height = 0.8,
      row = 0.5,
      col = 0.5,
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
    fzf_colors = true,
    fzf_opts = {
      ["--layout"] = "default",
      ["--no-scrollbar"] = true,
      ["--cycle"] = true,
      ["--wrap"] = true,
    },
    files = {
      cwd_prompt = false,
      actions = false,
      git_icons = false,
    },
    grep = { actions = false },
    keymaps = {
      winopts = {
        preview = {
          hidden = "hidden",
        },
      },
    },
    lsp = {
      code_actions = {
        winopts = {
          row = 0.7,
          height = 0.6,
          width = 0.5,
          preview = {
            layout = "vertical",
            vertical = "down:10,border-top",
          },
        },
        fzf_opts = { ["--layout"] = "reverse" },
        previewer = vim.fn.executable("delta") == 1 and "codeaction_native"
          or nil,
        preview_pager = vim.fn.executable("delta") == 1
            and "delta --width=$FZF_PREVIEW_COLUMNS --hunk-header-style='omit' --file-style='omit'"
          or nil,
      },
    },
  },
}
