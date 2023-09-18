return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-media-files.nvim",
			"nvim-telescope/telescope-symbols.nvim",
			"Marskey/telescope-sg",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		cmd = "Telescope",
		lazy = true,
		config = function()
			require("notify")
			local telescope = require("telescope")

			telescope.setup({
				defaults = {
					layout_strategy = "flex",
					layout_config = {
						flex = { flip_columns = 200 },
					},
					mappings = {
						i = { ["<esc>"] = require("telescope.actions").close },
					},
				},
				extensions = {
					ast_grep = {
						command = { "sg", "--json=stream", "-p" },
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("notify")
			telescope.load_extension("media_files")
			telescope.load_extension("persisted")
			telescope.load_extension("ast_grep")

			require("telescope-all-recent").setup({
				default = { sorting = "frecency" },
				pickers = {
					live_grep = { disable = false },
					grep_string = { disable = false },
				},
			})
		end,
	},
}
