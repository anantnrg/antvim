return {
	{
		"mvllow/modes.nvim",
		event = "VeryLazy",
		config = function()
			require("modes").setup({
				colors = {
					copy = "#d8a657",
					delete = "#e78a4e",
					insert = "#a9b665",
					visual = "#7daea3",
				},
				line_opacity = 0.15,
				set_cursor = true,
				set_cursorline = true,
				set_number = true,
				ignore_filetypes = { "NvimTree", "TelescopePrompt" },
			})
		end,
	},
	{
		"petertriho/nvim-scrollbar",
		event = "VeryLazy",
		opts = {
			handle = {
				color = "#7daea3",
			},
			handlers = {
				gitsigns = true,
			},
		},
	},
	{
		"rcarriga/nvim-notify",
		lazy = false,
		opts = {
			top_down = true,
			max_width = 100,
		},
	},
	{
		"folke/which-key.nvim",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 150
		end,
		opts = {
			window = {
				border = "rounded",
				position = "bottom",
				margin = { 10, 10, 2, 10 },
			},
		},
	},
}
