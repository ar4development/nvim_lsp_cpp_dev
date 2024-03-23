return {
	{
		"stevearc/conform.nvim",
		-- event = 'BufWritePre' -- uncomment for format on save
		config = function()
			require "configs.conform"
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require "configs.lspconfig"
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server", 
				"clangd", 
				"clang-format" , 
				"prettier", 
				"codelldb", 
				"pyright",
				"cmake-language-server"
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim"
			},
		},
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require('dap')
			dap.adapters.lldb = {
			  type = 'executable',
			  command = '/usr/bin/lldb-vscode-14',
			  name = 'lldb'
			}
			dap.configurations.cpp = {
			  {
			    name = "Launch",
			    type = "lldb",
			    request = "launch",
			    program = function()
			      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
			    end,
			    cwd = '${workspaceFolder}',
			    stopOnEntry = false,
			    args = {},
			    runInTerminal = true
			  }
			}

		end
	},
	{
		"nvim-neotest/nvim-nio"
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio"
		}
	},
	{
		"akinsho/toggleterm.nvim"
	}
}
