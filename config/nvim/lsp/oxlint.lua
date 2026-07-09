return {
  root_dir = function(bufnr, on_dir)
    -- prefer the top-level oxlint config if it exists (monorepo support)
    local git = vim.fs.root(bufnr, ".git")
    local markers = { ".oxlintrc.json", ".oxlintrc.jsonc", "oxlint.config.ts" }
    local root = git and vim.fs.root(git, markers)
      or vim.fs.root(bufnr, markers)
    if root then
      on_dir(root)
    end
  end,

  settings = {
    fixKind = "all",
  },
}
