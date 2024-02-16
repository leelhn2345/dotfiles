return {
	adapter = {
		type = "server",
		host = "127.0.0.1",
		port = 8123,
		executable = {
			command = "js-debug-adapter",
		},
	},
	debugger = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
			runtimeExecutable = "node",
			skipFiles = { "<node_internals>/**", "**/node_modules/**" },
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
			skipFiles = { "<node_internals>/**", "**/node_modules/**" },
		},
	},
}
