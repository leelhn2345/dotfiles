vim.api.nvim_create_autocmd("BufWinEnter", {
  group = vim.api.nvim_create_augroup("vertical_split", {}),
  callback = function()
    if
      (vim.bo.buftype == "help" or vim.bo.filetype == "man")
      and vim.o.columns >= 122 -- number derived with no-neck-pain.nvim experimentation
    then
      vim.cmd("wincmd L")
    end
  end,
})
