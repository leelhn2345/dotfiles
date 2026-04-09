--- @class JdtlsPlatformConfig
--- @field cmd string[]
--- @field runtimes { name: string, path: string, default?: boolean }[]

--- Returns platform-specific jdtls configuration based on the current OS.
--- @return JdtlsPlatformConfig
local function get_platform_config()
  local uname = vim.uv.os_uname().sysname -- has `Linux` & `Darwin`

  local lombok_arg = "--jvm-arg="
    .. string.format(
      "-javaagent:%s",
      vim.fn.expand("$HOME/.local/share/nvim/mason/share/jdtls/lombok.jar")
    )

  if uname == "Linux" then
    local sdkman_java = vim.fn.expand("~/.sdkman/candidates/java")

    -- Dynamically discover installed sdkman Java runtimes
    local runtime_specs = {
      { name = "JavaSE-17", glob = "17*" },
      { name = "JavaSE-21", glob = "21*" },
      { name = "JavaSE-25", glob = "25*" },
    }
    local runtimes = {}
    for _, spec in ipairs(runtime_specs) do
      local match = vim.fn.glob(sdkman_java .. "/" .. spec.glob, false, true)
      if #match > 0 then
        -- lua is 1-indexed
        table.insert(runtimes, { name = spec.name, path = match[1] .. "/" })
      end
    end

    return {
      cmd = {
        "jdtls",
        "--java-executable=" .. sdkman_java .. "/current/bin/java",
        lombok_arg,
      },
      runtimes = runtimes,
    }
  else
    return {
      cmd = { "jdtls", lombok_arg },
      runtimes = {},
    }
  end
end

return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  opts = function()
    local pc = get_platform_config()
    return {
      name = "jdtls",
      cmd = pc.cmd,
      init_options = {
        bundles = {},
      },
      settings = {
        java = {
          configuration = {
            runtimes = pc.runtimes,
          },
        },
      },
      root_dir = vim.fs.root(0, vim.lsp.config.jdtls.root_markers),
    }
  end,
  config = function(_, opts)
    local function attach_jdtls()
      require("jdtls").start_or_attach(opts)
    end

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("jdtls_attach", {}),
      pattern = "java",
      callback = attach_jdtls,
    })

    attach_jdtls()
  end,
}
