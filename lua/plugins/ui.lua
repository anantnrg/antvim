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
}
