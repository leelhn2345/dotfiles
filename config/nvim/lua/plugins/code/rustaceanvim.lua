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
      on_attach = function(_, bufnr)
        vim.keymap.set("n", "<leader>rs", function()
          vim.cmd.RustAnalyzer("restart")
        end, { desc = "Restart rust-analzyer", buffer = bufnr })
      end,
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
