local ExecTypes = {
	BIN = "cargo build -q --message-format=json",
	TEST = "cargo build --tests -q --message-format=json",
}

local function runBuild(type)
	-- Execute the Cargo build command based on the provided type ("BIN" or "TEST")
	local lines = vim.fn.systemlist(type)

	-- Concatenate the lines of the build output into a single string
	local output = table.concat(lines, "\n")

	-- Use regex to extract the executable from the build output
	local filename = output:match('^.*"executable":"(.*)",.*\n.*,"success":true}$')

	-- if filename is not found (nil), print error message and return
	if filename == nil then
		return error("failed to build cargo project")
	end

	return filename
end

return {
	adapter = {
		type = "server",
		port = "${port}",
		executable = {
			command = vim.fn.exepath("codelldb"), -- install `lldb` && use :Mason to install codelldb & cpptools
			args = { "--port", "${port}" },
		},
		name = "codelldb",
	},
	debugger = {
		{
			name = "Debug Bin",
			type = "codelldb",
			request = "launch",
			program = function()
				return runBuild(ExecTypes.BIN)
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			showDisassembly = "never",
		},
		{
			name = "Debug Test",
			type = "codelldb",
			request = "launch",
			program = function()
				return runBuild(ExecTypes.TEST)
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			showDisassembly = "never",
		},
	},
}
