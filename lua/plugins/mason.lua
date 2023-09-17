return {
	{
		"williamboman/mason.nvim",
		config = function ()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗"
					}
				}
			})
		end
	},
	{
	"williamboman/mason-lspconfig.nvim",
		lazy = true,
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")

			mason_lspconfig.setup({
				automatic_installation = false,
			})

			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({})
				end,
				rust_analyzer = nil,
				lua_ls = function()
					lspconfig.lua_ls.setup({
						settings = {
							Lua = {
								format = { enable = false },
								hint = { enable = true },
								runtime = { version = "LuaJIT" },
							},
						},
					})
				end,
			})
		end,
	},
}
