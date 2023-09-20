local opt = vim.opt
local g = vim.g
local map = vim.api.nvim_set_keymap
local set_option = vim.api.nvim_set_option

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.number = true
opt.relativenumber = false

opt.guifont = "JetBrains Mono:h10"
map("n", "<C-c>", '"+y', { noremap = true, silent = true })
map("i", "<C-v>", '<Esc>"+pa', { noremap = true, silent = true })
set_option("clipboard", "unnamedplus")

g.gruvbox_material_background = "hard"
g.gruvbox_material_enable_bold = 1
g.gruvbox_material_enable_italic = 1
vim.cmd.colorscheme("gruvbox-material")

opt.cursorline = true
opt.guicursor = "n-v-c:block,r-cr-o:hor20,i:ver20,a:blinkwait500-blinkoff400-blinkon150-Cursor/lCursor"
opt.laststatus = 3
opt.list = true
opt.pumblend = 0
opt.scrolloff = 4
opt.shortmess = "c"
opt.winblend = 0
opt.wrap = true
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
