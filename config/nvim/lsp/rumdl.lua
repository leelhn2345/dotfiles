---@type vim.lsp.Config
return {
  root_dir = function(bufnr, on_dir)
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    if vim.fs.root(bufnr, ".obsidian") then
      return
    end
    on_dir(vim.fs.dirname(bufname))
  end,
}
