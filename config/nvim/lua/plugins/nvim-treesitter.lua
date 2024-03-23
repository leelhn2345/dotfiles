local config = function()
  require("nvim-treesitter.configs").setup({
    -- indent = {
    --   enable = true,
    -- },
    autotag = {
      enable = true,
    },
    ensure_installed = {
      "rust",
      "markdown",
      "markdown_inline",
      "json",
      "javascript",
      "typescript",
      "yaml",
      "html",
      "css",
      "scss",
      "bash",
      "lua",
      "dockerfile",
      "python",
      "toml",
      "regex",
      "vim",
      "vimdoc",
      "query",
      "c",
      "sql",
      "tsx",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  })
end

return {
  "nvim-treesitter/nvim-treesitter",
  config = config,
  event = { "BufReadPre", "BufNewFile" },
}
