local map = require("core.utils").map

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
			local randomquote = require("core.utils").randomquote

			math.randomseed(os.time())

			local function pick_color()
				local colors = { "String", "Identifier", "Keyword", "Number" }
				return colors[math.random(#colors)]
			end

			dashboard.section.header.val = {
				"",
				"",
				"███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄   ",
				"███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄ ",
				"███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███ ",
				"███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███",
				"███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███ ",
				"███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███",
				"███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███ ",
				" ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀",
				"",
				"",
			}

			dashboard.section.header.opts.hl = pick_color()

			dashboard.section.buttons.val = {
				dashboard.button("e", "  -> New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("f", "  -> Find file", ":cd $HOME/ | Telescope find_files<CR>"),
				dashboard.button("r", "  -> Recent", ":Telescope oldfiles<CR>"),
				dashboard.button(
					"s",
					"  -> Settings",
					":e $HOME/.config/nvim/init.lua | :cd %:p:h | wincmd k | pwd<CR>"
				),
				dashboard.button("q", "  -> Quit NeoVim <noob>", ":qa<CR>"),
			}

			dashboard.section.footer.val = randomquote()
			dashboard.section.footer.opts.hl = pick_color()

			vim.api.nvim_create_autocmd("VimEnter", { command = "Alpha" })

			alpha.setup(dashboard.opts)
		end,
	},
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		enabled = true,
		lazy = false,
		opts = {
			presets = {
				bottom_search = false,
				command_palette = true,
				long_message_to_split = true,
				lsp_doc_border = true,
			},
			views = {
				messages = { backend = "popup" },
			},
			popupmenu = { enabled = true, backend = "nui" },
		},
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		opts = {
			input = { enabled = false },
			select = { enabled = true },
		},
	},
	-- indent lines. kinda like rainbow indent for vscode
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		opts = {
			show_current_context = true,
			show_current_context_start = false,
			use_treesitter = true,
			use_treesitter_scope = false,
			max_indent_increase = 1,
			show_trailing_blankline_indent = false,
			blankline_char_priority = 10,
			integrations = {
				neotree = {
					enabled = true,
					show_root = false,
					transparent_panel = false,
				},
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
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			local bufferline = require("bufferline")

			bufferline.setup({
				options = {
					style_preset = bufferline.style_preset.minimal,
					indication = {
						icon = "▎",
						style = "underline",
					},
					diagnostics = "nvim_lsp",
					separator_style = "thick",
				},
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "gruvbox-material",
					component_separators = "|",
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = {
						{ "mode", separator = { left = "" }, right_padding = 2 },
					},
					lualine_b = { "filename", "branch" },
					lualine_c = { "fileformat" },
					lualine_x = {},
					lualine_y = { "filetype", "searchcount" },
					lualine_z = {
						{ "location", separator = { right = "" }, left_padding = 2 },
					},
				},
			})
		end,
	},
}
