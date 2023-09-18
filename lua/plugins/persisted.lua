local map = require("core.utils").map

return {
	"olimorris/persisted.nvim",
	lazy = false,
	init = function()
		map({
			["<leader>S"] = { ":Telescope persisted<CR>", "Browse sessions" },
		})
		local group = vim.api.nvim_create_augroup("PersistedHooks", {})
		local ignored_file_types = { "Trouble", "neo-tree", "noice" }
		vim.api.nvim_create_autocmd({ "User" }, {
			pattern = "PersistedSavePre",
			group = group,
			callback = function()
				for _, buf in ipairs(vim.api.nvim_list_bufs()) do
					local file_type = vim.api.nvim_buf_get_option(buf, "filetype")
					if vim.tbl_contains(ignored_file_types, file_type) then
						vim.api.nvim_command("silent! bwipeout! " .. buf)
					end
				end
			end,
		})
	end,
	opts = {
		use_git_branch = true,
		autosave = true,
		autoload = true,
		follow_cwd = false,
	},
}
