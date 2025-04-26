local opt = vim.o

-- Tab / Indentation
opt.tabstop = 2 -- number of spaces per tab
opt.shiftwidth = 2 -- number of spaces for each level of indentation
opt.softtabstop = 2 -- how many spaces is a tab when in insert mode
opt.expandtab = true -- converts tab into spaces
opt.smartindent = true -- auto indentation
opt.wrap = false -- disable long lines from being wrapped

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.colorcolumn = "80"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menuone,popup,fuzzy"
opt.winborder = "rounded"

-- Behaviour
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.splitright = true
opt.splitbelow = true
vim.o.iskeyword = vim.o.iskeyword .. ",-"
opt.mouse = "a"

-- Clipboard for WSL2
if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end
