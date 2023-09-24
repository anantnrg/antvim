local map = require("core.utils").map

return {
	{
		"hrsh7th/nvim-cmp",
		event = "BufRead",
		dependencies = {
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-git",
			"hrsh7th/cmp-emoji",
			"saadparwaiz1/cmp_luasnip",
			"davidsierradz/cmp-conventionalcommits",
			"L3MON4D3/LuaSnip",
			"chrisgrieser/cmp-nerdfont",
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "luasnip" },
					{ name = "crates" },
				}, {
					{ name = "path" },
					{ name = "nerdfont" },
					{ name = "emoji" },
				}, {
					{ name = "buffer" },
				}),
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				formatting = {
					format = require("lspkind").cmp_format({
						mode = "symbol_text",
						with_text = false,
						before = function(entry, vim_item)
							return vim_item
						end,
					}),
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
			})

			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources(
					{ { name = "conventionalcommits" } },
					{ { name = "cmp_git" } },
					{ { name = "buffer" } }
				),
			})

			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})

			require("cmp_git").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		init = function()
			map({
				K = { vim.lsp.buf.hover, "Show documentation" },
				H = {
					function()
						vim.diagnostic.open_float({ border = "rounded" })
					end,
					"Show diagnostics",
				},
				["<C-k>"] = { vim.lsp.buf.signature_help, "Interactive signature help" },
				["<leader>r"] = {
					name = "refactor",
					n = { vim.lsp.buf.rename, "Interactive rename" },
					f = { vim.lsp.buf.format, "Format code" },
				},
				["<leader>a"] = {
					vim.lsp.buf.code_action,
					"Interactive list of code actions",
					mode = { "n", "v" },
				},
				["<leader>i"] = {
					function()
						vim.lsp.inlay_hint(0)
					end,
					"Toggle inlay hints for buffer",
				},
			})
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
		end,
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}
			lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					if client.server_capabilities.inlayHintProvider then
						vim.lsp.inlay_hint(bufnr, true)
					end
				end,
			})
		end,
	},
	{
		"onsails/lspkind.nvim",
		event = "LspAttach",
	},
	{
		"dnlhc/glance.nvim",
		cmd = "Glance",
		init = function()
			map({
				g = {
					d = { "<CMD>Glance definitions<CR>", "Peek definition(s)" },
					r = { "<CMD>Glance references<CR>", "Peek references" },
					D = { "<CMD>Glance type_definitions<CR>", "Peek declarations" },
					i = { "<CMD>Glance implementations<CR>", "Peek implementations" },
				},
			})
		end,
		config = function()
			local glance = require("glance")
			local actions = glance.actions
			glance.setup({
				height = 25,
				border = {
					enable = true,
					top_char = "▔",
					bottom_char = "▁",
				},
				theme = { enable = true, mode = "auto" },
				mappings = {
					list = {
						["<C-v>"] = actions.jump_vsplit,
						["<C-x>"] = actions.jump_split,
						["<C-t>"] = actions.jump_tab,
					},
				},
			})
		end,
	},
	{
		"folke/neodev.nvim",
		opts = {
			library = {
				enabled = true,
				runtime = true,
				types = true,
				plugins = true,
			},
			override = function(root_dir, options) end,
			lspconfig = true,
			pathStrict = true,
		},
	},
	{
		"elkowar/yuck.vim",
	},
}
