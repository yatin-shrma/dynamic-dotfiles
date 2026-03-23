return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dapui").setup()

		dap.adapters.cppdbg = {
			id = "cppdbg",
			type = "executable",
			command = "/home/acrux/.vscode/extensions/ms-vscode.cpptools-1.30.5-linux-x64/debugAdapters/bin/OpenDebugAD7",
		}

		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "cppdbg",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtEntry = true,
			},
		}

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
		vim.keymap.set("n", "<Leader>dx", dapui.float_element, {})
		vim.keymap.set("n", "<Leader>de", dapui.eval, {})
		vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<F5>", dap.continue, {})
		vim.keymap.set("n", "<Leader>8", dap.step_over, {})
		vim.keymap.set("n", "<Leader>9", dap.step_into, {})
		vim.keymap.set("n", "<Leader>0", dap.step_out, {})
        vim.keymap.set("n", '<Esc>',dapui.close,{})
	end,
}
