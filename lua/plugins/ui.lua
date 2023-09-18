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
	{
		"goolord/alpha-nvim",
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {
				"███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄   ",
				"███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄ ",
				"███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███ ",
				"███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███",
				"███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███ ",
				"███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███",
				"███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███ ",
				" ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀",
			}

			dashboard.section.buttons.val = {
				dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("f", "  > Find file", ":cd $HOME/ | Telescope find_files<CR>"),
				dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
				dashboard.button(
					"s",
					"  > Settings",
					":e $HOME/.config/nvim/init.lua | :cd %:p:h | wincmd k | pwd<CR>"
				),
				dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
			}

			alpha.setup(dashboard.opts)
		end,
	},
}
