return {
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
        -- make language server aware of runtime files
        library = {
          vim.env.VIMRUNTIME,
          "${3rd}/luv/library",
          vim.fn.stdpath("config") .. "/lua",
        },
      },
    },
  },
}
