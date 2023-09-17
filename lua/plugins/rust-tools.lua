return {
	"simrat39/rust-tools.nvim",
	event = { "BufReadPost *.rs" },
	opts = {
		tools = {
			inlay_hints = {
				auto = false,
			},
		},
		server = {
			standalone = false,
			on_attach = function(_, bufnr) end,
			["rust-analyzer"] = {
				semanticHighlighting = {
					["punctuation.enable"] = true,
					["punctuation.separate.macro.bang"] = true,
				},
				diagnostics = {
					enable = true,
					disabled = { "unresolved-method", "unresolved-field" },
					experimental = { enable = false },
				},
				assist = {
					emitMustUse = true,
				},
				procMacro = {
					enable = true,
				},
			},
		},
	},
}
