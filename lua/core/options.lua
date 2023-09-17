vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = false

vim.o.guifont = "JetBrains Mono:h11"
vim.api.nvim_set_keymap('n', '<C-c>', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-v>', '<Esc>"+pa', { noremap = true, silent = true })
vim.api.nvim_set_option("clipboard", "unnamedplus")

vim.g.gruvbox_material_background = "hard"
vim.cmd.colorscheme("gruvbox-material")

