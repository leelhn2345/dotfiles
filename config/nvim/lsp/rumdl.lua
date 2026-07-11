---@type vim.lsp.Config
return {
  root_dir = function(bufnr, on_dir)
    local bufname = vim.api.nvim_buf_get_name(bufnr)

    -- check for buffer's path prefix
    local vaults_dir = vim.fn.expand("~/vaults")
    if vim.startswith(bufname, vaults_dir) then
      return
    end

    -- -- checks for `.obsidian/` in ancestor directory
    -- if vim.fs.root(bufnr, ".obsidian") then
    --   return
    -- end

    on_dir(vim.fs.dirname(bufname))
  end,
}
