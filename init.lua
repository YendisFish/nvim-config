local noremap = function(mode, mapping, script)
    vim.keymap.set(mode, mapping, script, { noremap = true, silent = true })
end

local descnoremap = function(mode, mapping, script, desc)
    vim.keymap.set(mode, mapping, script, { noremap = true, silent = true, desc = desc })
end

-- LEADER --
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- BASICS --
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.clipboard = "unnamedplus"

-- TABS --
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- SAVE KEYMAPS --
vim.keymap.set("n", "<leader>ww", ":w<CR>")
vim.keymap.set("n", "<leader>wa", ":wa<CR>")
vim.keymap.set("n", "<leader>wq" , ":wqa<CR>")

-- LOAD LAZY --
require("plugins.lazy")

-- Navigation --
descnoremap("n", "<leader><leader>", "<C-^>", "Go to previous file")
noremap("n", "<C-s>", "^")
noremap("n", "<C-e>", "$")

-- PLugins --
descnoremap("n", "<leader>s", ":Telescope find_files<CR>", "Open file finder")
