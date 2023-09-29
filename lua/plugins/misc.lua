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
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			disable_filetype = { "TelescopePrompt" },
			map_bs = true,
			map_cr = true,
		},
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
}
