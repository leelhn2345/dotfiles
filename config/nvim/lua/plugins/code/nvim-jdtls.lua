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
    return {
      cmd = {
        "jdtls",
        "--java-executable="
          .. vim.fn.expand("~/.sdkman/candidates/java/25.0.2-tem/bin/java"),
        lombok_arg,
      },
      runtimes = {
        {
          name = "JavaSE-17",
          path = vim.fn.expand("~/.sdkman/candidates/java/17.0.18-tem/"),
          default = true,
        },
      },
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
