-- Mappings file
-- This is where all the custom mappings are defined

local builtin = require("telescope.builtin")

vim.keymap.set("n", ";", ":")

vim.keymap.set("i", "<C-j>", "<C-o>gj")
vim.keymap.set("i", "<C-k>", "<C-o>gk")
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Session keybinds
vim.keymap.set("n", "<leader>sl", "<cmd> Telescope persisted <CR>")
vim.keymap.set("n", "<leader>ss", "<cmd> SessionSave <CR>")
vim.keymap.set("n", "<leader>sd", "<cmd> SessionDelete <CR>")

-- Telescope bindings
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>th", builtin.colorscheme, {})
