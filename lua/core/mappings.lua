-- Mappings file
-- This is where all the custom mappings are defined

local builtin = require("telescope.builtin")

-- Makes it easier to map stuff.
local map = vim.keymap.set

map("n", ";", ":")

map("n", "<leader><leader>", "<cmd>noh<CR>")

map("i", "<C-j>", "<C-o>gj")
map("i", "<C-k>", "<C-o>gk")
map("i", "<C-h>", "<Left>")
map("i", "<C-l>", "<Right>")

map("n", "j", "gj")
map("n", "k", "gk")

-- Session keybinds
map("n", "<leader>sl", "<cmd> Telescope persisted <CR>")
map("n", "<leader>ss", "<cmd> SessionSave <CR>")
map("n", "<leader>sd", "<cmd> SessionDelete <CR>")

-- Telescope bindings
map("n", "<leader>ff", builtin.find_files, {})
map("n", "<leader>fg", builtin.live_grep, {})
map("n", "<leader>fb", builtin.buffers, {})
map("n", "<leader>fh", builtin.help_tags, {})
map("n", "<leader>th", builtin.colorscheme, {})
