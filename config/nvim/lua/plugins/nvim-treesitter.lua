return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
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
        "c_sharp",
        "java",
        "go",
        "gomod",
        "gosum",
        "http",
      },
      auto_install = false,
      highlight = {
        enable = true,
      },
    })
  end,
}
