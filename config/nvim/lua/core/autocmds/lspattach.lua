-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("user_lsp_config", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, noremap = true, silent = true }

    -- Breadcrumbs
    opts.desc = "Breadcrumbs"
    vim.keymap.set("n", "<leader>fj", ":Navbuddy<CR>", opts)

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for helpful documentation
    opts.desc = "Show LSP references"
    vim.keymap.set(
      "n",
      "gr",
      "<cmd>FzfLua lsp_references jump1=true ignore_current_line=true<CR>",
      opts
    ) -- show definition, references

    opts.desc = "Go to declaration"
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

    opts.desc = "Show LSP definition(s)"
    vim.keymap.set(
      "n",
      "gd",
      "<cmd>FzfLua lsp_definitions jump1=true ignore_current_line=true<cr>",
      opts
    ) -- show lsp definitions

    opts.desc = "Show LSP implementations"
    vim.keymap.set(
      "n",
      "gI",
      "<cmd>FzfLua lsp_implementations jump1=true ignore_current_line=true<cr>",
      opts
    ) -- show lsp implementations

    opts.desc = "Show LSP type definitions"
    vim.keymap.set(
      "n",
      "gt",
      "<cmd>FzfLua lsp_typedefs jump1=true ignore_current_line=true<cr>",
      opts
    ) -- show lsp type definitions

    opts.desc = "See available code actions"
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

    opts.desc = "Smart rename"
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

    opts.desc = "Hover"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

    opts.desc = "Restart LSP"
    vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
  end,
})
