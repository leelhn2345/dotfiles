local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("core.diagnostics")
require("core.filetypes")
require("core.globals")
require("core.keymaps")
require("core.options")

-- Load all autocommands from `core/autocmds/`
local autocmd_path = vim.fn.stdpath("config") .. "/lua/core/autocmds"
for _, file in ipairs(vim.fn.readdir(autocmd_path)) do
  if file:match("%.lua$") then
    local module_name = "core.autocmds." .. file:gsub("%.lua$", "")
    require(module_name)
  end
end

local plugins = {
  { import = "plugins" },
  { import = "plugins.code" },
}
local opts = {
  rtp = {
    disabled_plugins = {
      "gzip",
      "matchit",
      "matchparen",
      "netrw",
      "netrwPlugin",
      "tarPlugin",
      "tohtml",
      "tutor",
      "zipPlugin",
    },
  },
  change_detection = {
    notify = false,
  },
  ui = { border = "rounded" },
}
require("lazy").setup(plugins, opts)
