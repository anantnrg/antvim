vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = false

vim.o.guifont = "JetBrains Mono:h11"
vim.api.nvim_set_keymap("n", "<C-c>", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-v>", '<Esc>"+pa', { noremap = true, silent = true })
vim.api.nvim_set_option("clipboard", "unnamedplus")

vim.g.gruvbox_material_background = "hard"
vim.cmd.colorscheme("gruvbox-material")

vim.o.cursorline = true
vim.o.guicursor = "n-v-c:block,r-cr-o:hor20,i:ver20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
vim.o.laststatus = 3
vim.o.list = true
vim.o.pumblend = 0
vim.o.scrolloff = 4
vim.o.shortmess = "c"
vim.o.winblend = 0
vim.o.wrap = false
vim.opt.fillchars = {
	eob = " ",
	fold = " ",
	foldopen = "󰅀",
	foldclose = "󰅂",
	foldsep = " ",
	diff = "╳",
}
vim.opt.listchars = {
	tab = "→ ",
	nbsp = "␣",
	trail = "~",
	precedes = "«",
	extends = "»",
}
vim.o.autoindent = true
vim.o.expandtab = false
vim.o.smartindent = true
vim.o.smarttab = true
