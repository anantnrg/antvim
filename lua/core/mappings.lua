-- Mappings file
-- This is where all the custom mappings are defined

local builtin = require("telescope.builtin")

-- Makes it easier to map stuff.
local map = vim.keymap.set

set("n", ";", ":")

set("i", "<C-j>", "<C-o>gj")
set("i", "<C-k>", "<C-o>gk")
set("i", "<C-h>", "<Left>")
set("i", "<C-l>", "<Right>")

set("n", "j", "gj")
set("n", "k", "gk")

-- Session keybinds
set("n", "<leader>sl", "<cmd> Telescope persisted <CR>")
set("n", "<leader>ss", "<cmd> SessionSave <CR>")
set("n", "<leader>sd", "<cmd> SessionDelete <CR>")

-- Telescope bindings
set("n", "<leader>ff", builtin.find_files, {})
set("n", "<leader>fg", builtin.live_grep, {})
set("n", "<leader>fb", builtin.buffers, {})
set("n", "<leader>fh", builtin.help_tags, {})
set("n", "<leader>th", builtin.colorscheme, {})
