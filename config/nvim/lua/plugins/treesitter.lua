return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  opts = {
    auto_install = true,
    ignore_install = { "dockerfile", "tmux" },
    highlight = {
      enable = true,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
  -- "nvim-treesitter/nvim-treesitter",
  -- lazy = false,
  -- branch = "main",
  -- build = ":TSUpdate",
  -- init = function()
  --   vim.api.nvim_create_autocmd("FileType", {
  --     callback = function(args)
  --       local filetype = args.match
  --
  --       local excluded_filetypes = {
  --         "dockerfile",
  --         "tmux",
  --       }
  --       if vim.tbl_contains(excluded_filetypes, filetype) then
  --         return
  --       end
  --
  --       local lang = vim.treesitter.language.get_lang(filetype)
  --       local ts = require("nvim-treesitter")
  --       local ts_config = require("nvim-treesitter.config")
  --
  --       if not vim.tbl_contains(ts_config.get_available(), lang) then
  --         return
  --       end
  --
  --       if vim.tbl_contains(ts_config.get_installed(), lang) then
  --         vim.treesitter.start()
  --       else
  --         ts.install(lang):await(function()
  --           vim.treesitter.start()
  --         end)
  --       end
  --     end,
  --   })
  -- end,
}
