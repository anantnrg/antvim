return {
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup();
		end
	},
	{
		"echasnovski/mini.nvim",
		version = false,
	},
	{
		"rrethy/vim-illuminate",
		config = function()
			require('illuminate').configure({
			    providers = {
			        'lsp',
			        'treesitter',
			        'regex',
			    },
			    delay = 100,
				under_cursor = true,
			    large_file_cutoff = nil,
				large_file_overrides = nil,
				min_count_to_highlight = 1,
				should_enable = function(bufnr) return true end,
			    case_insensitive_regex = false,
			})
		end
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	}
}
