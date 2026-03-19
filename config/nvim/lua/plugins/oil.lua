-- helper function to parse output
local function parse_output(proc)
  local result = proc:wait()
  local ret = {}
  if result.code == 0 then
    for line in
      vim.gsplit(result.stdout, "\n", { plain = true, trimempty = true })
    do
      -- Remove trailing slash
      line = line:gsub("/$", "")
      ret[line] = true
    end
  end
  return ret
end

-- build git status cache (ignored files only)
local function new_git_status()
  return setmetatable({}, {
    __index = function(self, key)
      local ignore_proc = vim.system({
        "git",
        "ls-files",
        "--ignored",
        "--exclude-standard",
        "--others",
        "--directory",
      }, {
        cwd = key,
        text = true,
      })
      local ret = { ignored = parse_output(ignore_proc) }
      rawset(self, key, ret)
      return ret
    end,
  })
end
local git_status = new_git_status()

return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Oil",
  keys = {
    { "-", ":Oil --float<CR>", desc = "Open parent directory", silent = true },
  },
  config = function()
    -- Clear git status cache on refresh
    local refresh = require("oil.actions").refresh
    local orig_refresh = refresh.callback
    refresh.callback = function(...)
      git_status = new_git_status()
      orig_refresh(...)
    end

    require("oil").setup({
      keymaps = {
        ["q"] = { "actions.close", mode = "n" },
      },
      skip_confirm_for_simple_edits = true,
      win_options = {
        wrap = true,
      },
      view_options = {
        is_hidden_file = function(name, bufnr)
          if name == ".git" then
            return true
          end
          local dir = require("oil").get_current_dir(bufnr)
          if not dir then
            return false
          end
          if vim.startswith(name, ".env") then
            return false
          end
          return git_status[dir].ignored[name]
        end,
      },
      float = {
        max_width = 90,
        border = "rounded",
      },
      confirmation = {
        border = "rounded",
      },
    })
  end,
}