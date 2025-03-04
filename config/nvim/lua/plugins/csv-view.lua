return {
  "hat0uma/csvview.nvim",
  ft = "csv",
  opts = {
    parser = {
      comments = {
        "#",
        "--",
        "//",
      },
    },
  },
  config = function(_, opts)
    require("csvview").setup(opts)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "csv",
      desc = "Enable CSV View on .csv files",
      callback = function()
        vim.cmd("CsvViewEnable")
      end,
    })
  end,
}
