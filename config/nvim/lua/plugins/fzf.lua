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
    { "<leader>fr", ":FzfLua resume<CR>", silent = true, desc = "Fzf resume" },
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
      title_flags = false,
    },
    keymap = {
      fzf = {
        ["ctrl-q"] = "select-all+accept",
      },
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
    keymaps = {
      winopts = {
        preview = {
          hidden = "hidden",
        },
      },
    },
    lsp = {
      code_actions = {
        fzf_opts = { ["--layout"] = "reverse" },
        previewer = vim.fn.executable("delta") == 1 and "codeaction_native"
          or nil,
        preview_pager = vim.fn.executable("delta") == 1
            and "delta --width=$FZF_PREVIEW_COLUMNS --hunk-header-style='omit' --file-style='omit'"
          or nil,
      },
    },
  },
  config = function(_, opts)
    local fzf_lua = require("fzf-lua")

    fzf_lua.setup(opts)

    fzf_lua.register_ui_select(function(fzf_opts, items)
      return fzf_opts.kind == "codeaction"
          and {
            winopts = {
              row = 0.7,
              -- height is number of items minus 15 lines for the preview, with a max of 80% screen height
              height = math.floor(
                math.min(vim.o.lines * 0.8 - 16, #items + 2) + 0.5
              ) + 16,
              width = 80,
              preview = not vim.tbl_isempty(
                    vim.lsp.get_clients({ bufnr = 0, name = "vtsls" })
                  )
                  and {
                    layout = "vertical",
                    vertical = "down:15,border-top",
                    hidden = "hidden",
                  }
                or {
                  layout = "vertical",
                  vertical = "down:15,border-top",
                },
            },
          }
        or {
          winopts = {
            width = 80,
            height = math.floor(math.min(vim.o.lines * 0.8, #items + 2) + 0.5),
          },
        }
    end)
  end,
}
