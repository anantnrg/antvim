return {
	{
		"elentok/format-on-save.nvim",
		cmd = { "Format" },
		event = { "BufRead" },
		opts = function()
			local formatters = require("format-on-save.formatters")
			return {
				experiments = { partial_update = true },
				formatter_by_ft = {
					json = formatters.lsp,
					lua = formatters.stylua,
					rust = formatters.lsp,
					sh = formatters.shfmt,
					toml = formatters.lsp,
					yaml = formatters.lsp,
				},
			}
		end,
	},
}
