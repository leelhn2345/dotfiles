return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  opts = {
    name = "jdtls",
    cmd = { "jdtls" },
    settings = {
      java = {},
    },
    init_options = {
      bundles = {},
    },
  },
  config = function(_, opts)
    local config = vim.tbl_extend(
      "force",
      opts,
      { root_dir = vim.fs.root(0, vim.lsp.config.jdtls.root_markers) }
    )
    require("jdtls").start_or_attach(config)
  end,
}
