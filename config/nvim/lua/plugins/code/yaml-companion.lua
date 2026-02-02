-- TODO: check for any new yamlls release after 1.19.2
-- can remove this plugin and use yaml.kubernetesCRDStore.enable
--
-- Other resources
-- - https://github.com/redhat-developer/yaml-language-server/commit/5268a0300ce3dcdd54c7e48961a4f3b17a90baac
-- - https://www.lazyvim.org/extras/lang/yaml
return {
  "mosheavni/yaml-companion.nvim",
  ft = { "yaml" },
  opts = {},
  config = function(_, opts)
    local cfg = require("yaml-companion").setup(opts)
    vim.lsp.config("yamlls", cfg)
    vim.lsp.enable("yamlls")
  end,
}
