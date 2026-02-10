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
      group = vim.api.nvim_create_augroup("csv_view_auto", {}),
      pattern = "csv",
      desc = "Enable CSV View on .csv files",
      callback = function()
        vim.cmd("CsvViewEnable")
      end,
    })
  end,
}
