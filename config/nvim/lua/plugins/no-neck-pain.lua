return {
  "shortcuts/no-neck-pain.nvim",
  event = "BufWinEnter",
  cmd = { "NoNeckPain" },
  keys = {
    {
      "<leader>np",
      ":NoNeckPain<CR>",
      desc = "Toggles neck pain",
      silent = true,
    },
  },
  opts = {},
  config = function(_, opts)
    local nnp = require("no-neck-pain")

    nnp.setup(opts)

    -- only enable once a real file buffer is entered, not on the starting page.
    -- still fires for the first buffer even when nvim is opened with a file arg.
    local group = vim.api.nvim_create_augroup(
      "NoNeckPainEnableOnFileBuffer",
      { clear = true }
    )

    vim.api.nvim_create_autocmd("BufWinEnter", {
      group = group,
      pattern = "*",
      callback = function()
        if vim.bo.buftype ~= "" or vim.api.nvim_buf_get_name(0) == "" then
          return
        end

        nnp.enable()

        -- this autocmd is a 1-shot command, hence i'm deleting it after it
        -- serves its purpose.
        vim.api.nvim_del_augroup_by_id(group)
      end,
    })
  end,
}
