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
			"pyright"
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
}