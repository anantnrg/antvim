return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
		},
		config = function()
			require("nvim-treesitter.configs").setup {
				auto_install = true,
				ensure_installed = {
					"bash",
					"fish",
					"json",
					"lua",
					"markdown",
					"nix",
					"python",
					"rust",
					"toml",
					"vim",
				},
				indent = { enable = true },
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				incremental_selection = {
					enable = false,
					keymaps = {
						init_selection = "<CR>",
						scope_incremental = "<CR>",
						node_incremental = "<TAB>",
						node_decremental = "<S-TAB>",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = { query = "@function.outer", desc = "outer function" },
							["if"] = { query = "@function.inner", desc = "inner function" },
							["ac"] = { query = "@class.outer", desc = "outer class" },
							["ic"] = { query = "@class.inner", desc = "inner class" },
							["an"] = { query = "@parameter.outer", desc = "outer parameter" },
							["in"] = { query = "@parameter.inner", desc = "inner parameter" },
						},
					},
					swap = { enable = true },
					lsp_interop = {
						enable = true,
						border = "rounded",
						peek_definition_code = {
							["<leader>df"] = "@function.outer",
							["<leader>dF"] = "@class.outer",
						},
					},
				},
				matchup = {
					enable = true,
				},
				context_commentstring = {
					enable = true,
				},
				playground = { enable = true },
				query_linter = {
					enable = true,
					use_virtual_text = true,
					lint_events = { "BufWrite", "CursorHold" },
				},
			}
		end,
	},
	-- Show sticky context for off-screen scope beginnings
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufRead",
		opts = {
			enable = true,
			max_lines = 5,
			trim_scope = "outer",
			zindex = 40,
			mode = "cursor",
			separator = "🮕",
		},
	},
}
