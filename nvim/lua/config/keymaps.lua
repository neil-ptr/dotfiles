-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
vim.api.nvim_set_keymap("n", "zz", "zz:noh<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true })

-- Fix lazyvim moving lines up or down: https://github.com/LazyVim/LazyVim/discussions/658
vim.api.nvim_set_keymap("n", "<A-k>", "<esc>k", { desc = "Move up", noremap = true })
vim.api.nvim_set_keymap("n", "<A-j>", "<esc>j", { desc = "Move down", noremap = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<esc>gk", { desc = "Move up", noremap = true })
vim.api.nvim_set_keymap("i", "<A-j>", "<esc>gj", { desc = "Move down", noremap = true })
vim.api.nvim_set_keymap("v", "<A-k>", "<esc>gk", { desc = "Move up", noremap = true })
vim.api.nvim_set_keymap("v", "<A-j>", "<esc>gj", { desc = "Move down", noremap = true })
