vim.g.mapleader = "C-b"
vim.g.maplocalleader = "C-b"
local opt = { noremap = true, silent = true }
vim.keymap.set("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
