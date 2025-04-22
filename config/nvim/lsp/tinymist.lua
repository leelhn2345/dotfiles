-- https://github.com/Myriad-Dreamin/tinymist/blob/main/editors/neovim/Configuration.md
return {
  settings = {
    formatterMode = "typstfmt",
    formatterPrintWidth = 80,
    -- exportPdf = "onType",
    -- outputPath = "$root/target/$dir/$name",
  },
  on_attach = function(_, bufnr)
    vim.keymap.set(
      "n",
      "<leader>tp",
      "<cmd>TypstPreview<CR>",
      { desc = "Typst preview", buffer = bufnr }
    )
  end,
}
