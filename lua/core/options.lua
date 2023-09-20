local opt = vim.opt

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.number = true
opt.relativenumber = false

opt.guifont = "JetBrains Mono:h10"
vim.api.nvim_set_keymap("n", "<C-c>", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-v>", '<Esc>"+pa', { noremap = true, silent = true })
vim.api.nvim_set_option("clipboard", "unnamedplus")

vim.g.gruvbox_material_background = "hard"
vim.cmd.colorscheme("gruvbox-material")

opt.cursorline = true
opt.guicursor = "n-v-c:block,r-cr-o:hor20,i:ver20,a:blinkwait500-blinkoff400-blinkon150-Cursor/lCursor"
opt.laststatus = 3
opt.list = true
opt.pumblend = 0
opt.scrolloff = 4
opt.shortmess = "c"
opt.winblend = 0
opt.wrap = false
opt.fillchars = {
	eob = " ",
	fold = " ",
	foldopen = "󰅀",
	foldclose = "󰅂",
	foldsep = " ",
	diff = "╳",
}
opt.listchars = {
	tab = "→ ",
	nbsp = "␣",
	trail = "~",
	precedes = "«",
	extends = "»",
	space = "⋅",
}
opt.autoindent = true
opt.expandtab = false
opt.smartindent = true
opt.smarttab = true
