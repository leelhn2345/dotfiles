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
    local function attach_jdtls()
      local config = vim.tbl_extend(
        "force",
        opts,
        { root_dir = vim.fs.root(0, vim.lsp.config.jdtls.root_markers) }
      )
      require("jdtls").start_or_attach(config)
    end

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("jdtls_attach", {}),
      pattern = "java",
      callback = attach_jdtls,
    })

    attach_jdtls()
  end,
}
