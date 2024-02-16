return {
  -- debugger-ui
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      {
        "<leader>db",
        ":lua require('dapui').toggle()<CR>",
        desc = "Debugger UI",
        silent = true,
      },
    },
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      require("dapui").setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  -- debugger
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<leader>dp",
        ":DapToggleBreakpoint<CR>",
        desc = "Debugger Breakpoint",
        silent = true,
      },
      {
        "<F5>",
        ":DapContinue<CR>",
        desc = "Debugger Continue",
        silent = true,
      },
    },
    config = function()
      local dap = require("dap")

      -- rust
      local dap_rust = require("plugins.configs.dap-rust")

      dap.adapters.codelldb = dap_rust.adapter

      if vim.fn.has("win32") == 1 then
        dap.adapters.codelldb.executable.detached = false
      end

      dap.configurations.rust = dap_rust.debugger

      -- nodeJS
      local dap_nodejs = require("plugins.configs.dap-nodejs")
      dap.adapters["pwa-node"] = dap_nodejs.adapter

      for _, language in ipairs({ "typescript", "javascript" }) do
        dap.configurations[language] = dap_nodejs.debugger
      end

      -- Set keymaps to control the debugger
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<F10>", ":DapStepOver<CR>", opts)
      vim.keymap.set("n", "<F11>", ":DapStepInto<CR>", opts)
      vim.keymap.set("n", "<F12>", ":DapStepOut<CR>", opts)
      vim.keymap.set("n", "<S-F5>", ":DapTerminate<CR>", opts)

      opts.desc = "Conditional Breakpoint"
      vim.keymap.set("n", "<leader>dB", function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, opts)
    end,
  },

  -- python
  require("plugins.configs.dap-python"),
}
