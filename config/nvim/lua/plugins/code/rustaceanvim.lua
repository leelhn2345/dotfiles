return {
  "mrcjkb/rustaceanvim",
  version = "^5", -- Recommended
  ft = { "rust" },
  opts = {
    tools = {
      float_win_config = {
        auto_focus = true,
      },
    },
    server = {
      -- on_attach = function(_, bufnr)
      --   vim.keymap.set("n", "<leader>ce", ":RustLsp explainError<CR>", {
      --     silent = true,
      --     buffer = bufnr,
      --     desc = "Explain code error",
      --   })
      -- end,
      default_settings = {
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true,
            loadOutDirsFromCheck = true,
            buildScripts = {
              enable = true,
            },
          },
          procMacro = {
            enable = true,
            ignored = {
              ["async-trait"] = { "async_trait" },
              ["napi-derive"] = { "napi" },
              ["async-recursion"] = { "async_recursion" },
            },
          },
          files = {
            excludeDirs = {
              ".direnv",
              ".git",
              ".github",
              ".gitlab",
              "bin",
              "node_modules",
              "target",
              "venv",
              ".venv",
            },
          },
        },
      },
    },
  },
  config = function(_, opts)
    vim.g.rustaceanvim = opts
  end,
}
