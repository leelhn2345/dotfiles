return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- NOTE: read via package.loaded (never require()) so lualine doesn't force
    -- obsidian.nvim to load before a vault buffer is opened. Forcing it early
    -- breaks obsidian's own workspace detection (used by e.g. `Obsidian tags`).
    local function obsidian_sync_status()
      return package.loaded["obsidian.sync.status"]
    end

    require("lualine").setup({
      options = {
        globalstatus = true,
      },
      sections = {
        lualine_x = {
          {
            function()
              local status = obsidian_sync_status()
              return status and status.icon() or ""
            end,
            color = function()
              local status = obsidian_sync_status()
              return status and status.color()
            end,
            cond = function()
              local status = obsidian_sync_status()
              return status ~= nil and status.cond()
            end,
          },
          "encoding",
          "fileformat",
          "filetype",
        },
        lualine_b = {
          "branch",
          {
            "diagnostics",
            sources = {
              "nvim_workspace_diagnostic",
            },
          },
        },
      },
    })
  end,
}
