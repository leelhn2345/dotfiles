--- @class JdtlsConfig
--- @field cmd string[]
--- @field runtimes { name: string, path: string, default?: boolean }[]

--- Returns jdtls & runtime(s) configuration.
--- @return JdtlsConfig
local function get_jdtls_config()
  local lombok_arg = "--jvm-arg="
    .. string.format(
      "-javaagent:%s",
      vim.fn.expand("$HOME/.local/share/nvim/mason/share/jdtls/lombok.jar")
    )

  local mise_data = vim.env.MISE_DATA_DIR
    or vim.fn.expand("~/.local/share/mise")

  local mise_java = mise_data .. "/installs/java"

  -- Dynamically discover installed mise Java runtimes
  -- dirs look like "temurin-17.0.20+101", "corretto-21.0.5", "21.0.2"
  local runtime_specs = {
    { name = "JavaSE-17", major = "17" },
    { name = "JavaSE-21", major = "21" },
    { name = "JavaSE-25", major = "25" },
  }

  local entries = vim.fn.isdirectory(mise_java) == 1
      and vim.fn.readdir(mise_java)
    or {}
  table.sort(entries, function(a, b)
    return a > b
  end)

  local runtimes = {}
  for _, spec in ipairs(runtime_specs) do
    for _, entry in ipairs(entries) do
      if entry:match("^%a*%-?" .. spec.major .. "%f[^%d]") then
        -- resolve aliases like "temurin-17" -> "temurin-17.0.20+101"
        local path = vim.uv.fs_realpath(mise_java .. "/" .. entry)
        if path then
          table.insert(runtimes, { name = spec.name, path = path })
          break
        end
      end
    end
  end

  -- jdtls itself needs java 21+, so run it with the newest runtime found
  local java_bin = "java"
  if #runtimes > 0 then
    runtimes[#runtimes].default = true
    java_bin = runtimes[#runtimes].path .. "/bin/java"
  end

  return {
    cmd = {
      "jdtls",
      "--java-executable=" .. java_bin,
      lombok_arg,
    },
    runtimes = runtimes,
  }
end

return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  opts = function()
    local cfg = get_jdtls_config()
    return {
      name = "jdtls",
      cmd = cfg.cmd,
      init_options = {
        bundles = {},
      },
      settings = {
        java = {
          configuration = {
            runtimes = cfg.runtimes,
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
