-- Mappings file
-- This is where all the custom mappings are defined

local builtin = require('telescope.builtin')

vim.keymap.set("n", ";", ":")

-- Session keybinds
vim.keymap.set(
	"n",
	"<leader>sl",
	function ()
		require("resession").load()
	end
)
vim.keymap.set(
	"n",
	"<leader>ss",
	function ()
		require("resession").save()
	end
)
vim.keymap.set(
	"n",
	"<leader>sd",
	function ()
		require("resession").delete()
	end
)

-- Telescope bindings
vim.keymap.set(
	'n',
	'<leader>ff',
	builtin.find_files,
	{}
)
vim.keymap.set(
	'n',
	'<leader>fg',
	builtin.live_grep,
	{}
)
vim.keymap.set(
	'n',
	'<leader>fb',
	builtin.buffers,
	{}
)
vim.keymap.set(
	'n',
	'<leader>fh',
	builtin.help_tags, 
	{}
)
