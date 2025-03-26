return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		dapui.setup()

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

		local keymap = vim.keymap

		--  vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
		-- vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
		-- vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
		-- vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
		-- vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
		-- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
		-- vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
		-- vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
		-- vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
		-- vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
		--   require('dap.ui.widgets').hover()
		-- end)
		-- vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
		--   require('dap.ui.widgets').preview()
		-- end)
		-- vim.keymap.set('n', '<Leader>df', function()
		--   local widgets = require('dap.ui.widgets')
		--   widgets.centered_float(widgets.frames)
		-- end)
		-- vim.keymap.set('n', '<Leader>ds', function()
		--   local widgets = require('dap.ui.widgets')
		--   widgets.centered_float(widgets.scopes)
		-- end)

		keymap.set("n", "<F5>", function()
			dap.continue()
		end, { noremap = true, silent = false, desc = "Dap continue" })
		keymap.set("n", "<F10>", function()
			dap.step_over()
		end, { noremap = true, silent = false, desc = "Dap step over" })
		keymap.set("n", "<F11>", function()
			dap.step_into()
		end, { noremap = true, silent = false, desc = "Dap step into" })
		keymap.set("n", "<F12>", function()
			dap.step_out()
		end, { noremap = true, silent = false, desc = "Dap step out" })
		keymap.set("n", "<leader>b", function()
			dap.toggle_breakpoint()
		end, { noremap = true, silent = false, desc = "Dap set breakpoint" })
		keymap.set("n", "<leader>B", function()
			dap.set_breakpoint()
		end, { noremap = true, silent = false, desc = "Dap set breakpoint" })

		dap.adapters.delve = function(callback, config)
			if config.mode == "remote" and config.request == "attach" then
				callback({
					type = "server",
					host = config.host or "127.0.0.1",
					port = config.port or "38697",
				})
			else
				callback({
					type = "server",
					port = "${port}",
					executable = {
						command = "dlv",
						args = { "dap", "-l", "127.0.0.1:${port}", "--log", "--log-output=dap" },
						detached = vim.fn.has("win32") == 0,
					},
				})
			end
		end

		-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
		dap.configurations.go = {
			{
				type = "delve",
				name = "Debug",
				request = "launch",
				program = "${file}",
			},
			{
				type = "delve",
				name = "Debug test", -- configuration for debugging test files
				request = "launch",
				mode = "test",
				program = "${file}",
			},
			-- works with go.mod packages and sub packages
			{
				type = "delve",
				name = "Debug test (go.mod)",
				request = "launch",
				mode = "test",
				program = "./${relativeFileDirname}",
			},
		}
	end,
}
