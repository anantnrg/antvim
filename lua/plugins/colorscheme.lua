return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			term_colors = true,
			integrations = {
				telescope = true,
				neotree = {
					enabled = true,
					show_root = true,
					transparent_panel = false,
				},
				indent_blankline = {
					enabled = false,
					colored_indent_levels = false,
				},
				cmp = true,
				gitsigns = true,
				notify = true,
				mini = true,
				native_lsp = {
					inlay_hints = { background = false },
				},
			},
			compile = {
				enabled = true,
			},
		})
	end,
}
