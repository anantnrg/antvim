-- Copied from @calops (https://github.com/calops)
local module = {}

module.map = function(mappings, opts)
	return require("which-key").register(mappings, opts)
end

function module.reverse_table(table)
	for i = 1, math.floor(#table / 2), 1 do
		table[i], table[#table - i + 1] = table[#table - i + 1], table[i]
	end
	return table
end

module.randomquote = function()
	local quote = {
		"i are programmer. i make computer beep boop boop beep!",
		"bing chillin",
		"The system plays us everday...",
		"Rust is best!",
		"Rust4Life",
		"I 󰣐 Rust",
		'"rewrite everthing in rust" - some random guy on 4chan',
		'"fuck vaxerski" - me',
		'"hyprland community baaadddd" - me',
		"strata go brrrrrr",
		"shh...don'tell the fbi, but we're living in a simulation",
	}
	math.randomseed(os.time())
	return quote[math.random(1, #quote)]
end

module.nvim_settings = function()
	vim.cmd(":e $MYVIMRC")
	vim.cmd(":cd ~/.config/nvim")
	vim.cmd(":NvimTreeOpen")
end

return module
