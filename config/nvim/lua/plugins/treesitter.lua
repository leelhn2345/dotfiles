return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  init = function()
    -- register parser for dotenv
    vim.treesitter.language.register("bash", { "dotenv" })
    vim.treesitter.language.register("markdown", { "mdx" })

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("TreeSitterHighlight", {}),
      callback = function(args)
        local filetype = args.match

        local excluded_filetypes = {
          "dockerfile",
          "tmux",
        }
        if vim.list_contains(excluded_filetypes, filetype) then
          return
        end

        local lang = vim.treesitter.language.get_lang(filetype)
        local ts = require("nvim-treesitter")

        if not vim.list_contains(ts.get_available(), lang) then
          return
        end

        if vim.list_contains(ts.get_installed(), lang) then
          vim.treesitter.start()
        else
          ts.install(lang):await(function()
            vim.treesitter.start()
          end)
        end
      end,
    })
  end,
}
