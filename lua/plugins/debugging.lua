return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap = require("dap")
		require("dapui").setup()
		local dapui = require("dapui")

		-- dap binds
		vim.keymap.set("n", "<Leader>db", ":DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint" })
		vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>", { desc = "Continue" })
		vim.keymap.set("n", "<Leader>di", ":DapStepInto<CR>", { desc = "Step into" })
		vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>", { desc = "Step over" })
		vim.keymap.set("n", "<Leader>du", ":DapStepOut<CR>", { desc = "Step out" })
		vim.keymap.set("n", "<Leader>dn", ":DapNew<CR>", { desc = "New Debug Session" })
		vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>", { desc = "Terminate session" })

		-- python
		require("dap-python").setup("python3")

		-- c++
		dap.adapters.cppdbg = {
			id = "cppdbg",
			type = "executable",
			command = "/home/transsonicgirl/.cpptools/extension/debugAdapters/bin/OpenDebugAD7",
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
			{
				name = "Attach to gdbserver :1234",
				type = "cppdbg",
				request = "launch",
				MIMode = "gdb",
				miDebuggerServerAddress = "localhost:1234",
				miDebuggerPath = "/usr/bin/gdb",
				cwd = "${workspaceFolder}",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
			},
		}

		-- c/rust
		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp

		-- dapui listeners
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
	end,
}
