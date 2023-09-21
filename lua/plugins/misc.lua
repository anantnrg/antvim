return {
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"echasnovski/mini.nvim",
		version = false,
	},
	{
		"rrethy/vim-illuminate",
		config = function()
			require("illuminate").configure({
				providers = {
					"lsp",
					"treesitter",
					"regex",
				},
				delay = 100,
				under_cursor = true,
				large_file_cutoff = nil,
				large_file_overrides = nil,
				min_count_to_highlight = 1,
				should_enable = function(bufnr)
					return true
				end,
				case_insensitive_regex = false,
			})
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	{
		"nmac427/guess-indent.nvim",
		event = "BufReadPre",
		config = true,
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = true,
	},
	{
		"m4xshen/autoclose.nvim",
		config = function()
			require("autoclose").setup({
				keys = {
					["("] = { escape = false, close = true, pair = "()" },
					["["] = { escape = false, close = true, pair = "[]" },
					["{"] = { escape = false, close = true, pair = "{}" },

					[">"] = { escape = true, close = false, pair = "<>" },
					[")"] = { escape = true, close = false, pair = "()" },
					["]"] = { escape = true, close = false, pair = "[]" },
					["}"] = { escape = true, close = false, pair = "{}" },

					['"'] = { escape = true, close = true, pair = '""' },
					["'"] = { escape = true, close = true, pair = "''" },
					["`"] = { escape = true, close = true, pair = "``" },
				},
				options = {
					disabled_filetypes = { "text" },
					disable_when_touch = false,
					touch_regex = "[%w(%[{]",
					pair_spaces = false,
					auto_indent = true,
				},
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				padding = true,
				sticky = false,
				toggler = {
					line = "gcc",
					block = "gbc",
				},
				mappings = {
					basic = true,
				},
			})
		end,
	},
	{
		"folke/twilight.nvim",
		opts = {},
	},
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {},
	},
}
