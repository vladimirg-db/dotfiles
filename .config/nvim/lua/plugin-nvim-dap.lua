require("dapui").setup()
local dap, dapui = require("dap"), require("dapui")

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

dap.adapters.lldb = {
	type = "executable",
	command = "/opt/homebrew/opt/llvm/bin/lldb-dap",
	name = "lldb",
}

local dap = require("dap")
dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		runInTerminal = true,
		args = {},
	},
}
dap.configurations.scala = {
	{
		type = "scala",
		request = "attach",
		name = "Debug (Attach) - Remote",
		hostName = "127.0.0.1",
		port = 5005,
	},
}

vim.keymap.set("n", "<leader>dc", function()
	require("dap").continue()
end)
vim.keymap.set("n", "<leader>do", function()
	require("dap").step_over()
end)
vim.keymap.set("n", "<leader>di", function()
	require("dap").step_into()
end)
vim.keymap.set("n", "<leader>doo", function()
	require("dap").step_out()
end)
vim.keymap.set("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end)
