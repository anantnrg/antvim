local map = require("core.utils").map

return {
	{
		"mvllow/modes.nvim",
		event = "VeryLazy",
		config = function()
			require("modes").setup({
				colors = {
					copy = "#f9e2af",
					delete = "#f38ba8",
					insert = "#a6e3a1",
					visual = "#89b4fa",
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
			top_down = false,
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
				highlights = require("catppuccin.groups.integrations.bufferline").get(),
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			local custom_catppuccin = require("lualine.themes.catppuccin-mocha")

			custom_catppuccin.normal.a.bg = "#a6e3a1"
			custom_catppuccin.insert.a.bg = "#f38ba8"
			custom_catppuccin.normal.b.bg = "#cba6f7"
			custom_catppuccin.insert.b.bg = "#cba6f7"
			custom_catppuccin.visual.b.bg = "#cba6f7"
			custom_catppuccin.replace.b.bg = "#cba6f7"
			custom_catppuccin.command.b.bg = "#cba6f7"
			custom_catppuccin.normal.b.fg = "#181825"
			custom_catppuccin.insert.b.fg = "#181825"
			custom_catppuccin.visual.b.fg = "#181825"
			custom_catppuccin.replace.b.fg = "#181825"
			custom_catppuccin.command.b.fg = "#181825"
			custom_catppuccin.normal.b.gui = "bold"
			custom_catppuccin.insert.b.gui = "bold"
			custom_catppuccin.visual.b.gui = "bold"
			custom_catppuccin.replace.b.gui = "bold"
			custom_catppuccin.command.b.gui = "bold"

			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = custom_catppuccin,
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = {
						{ "mode", separator = { left = "", right = "" }, right_padding = 8 },
					},
					lualine_b = { "filename" },
					lualine_c = { "branch" },
					lualine_x = {},
					lualine_y = { "filetype", "searchcount" },
					lualine_z = {
						{ "location", separator = { left = "", right = "" }, left_padding = 8 },
					},
				},
			})
		end,
	},
	{
		"Bekaboo/dropbar.nvim",
		event = "UIEnter",
		version = "*",
		enabled = not vim.g.started_by_firenvim,
		config = function()
			require("dropbar").setup({
				menu = {
					win_configs = {
						border = "rounded",
					},
				},
			})
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		cmd = "Neotree",
		init = function()
			map({
				["<leader>n"] = {
					name = "file tree",
					n = { ":Neotree toggle reveal_force_cwd<cr>", "Toggle file browser" },
					g = { ":Neotree toggle git_status<cr>", "Show git status" },
					b = { ":Neotree toggle buffers<cr>", "Show open buffers" },
				},
			})
		end,
		opts = {
			popup_border_style = "rounded",
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = true,
				},
			},
			source_selector = {
				winbar = true,
				statusline = false,
			},
			default_component_config = {
				modified = {
					symbol = "",
					highlight = "NeoTreeModified",
				},
			},
		},
	},
}
