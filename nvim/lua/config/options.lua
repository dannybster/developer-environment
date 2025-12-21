-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_php_lsp = "intelephense"

vim.o.expandtab = true -- expand tab input with spaces characters
vim.o.smartindent = true -- syntax aware indentations for newline inserts
vim.o.tabstop = 2 -- num of space characters per tab
vim.o.shiftwidth = 2 -- spaces per indentation level

vim.o.scrolloff = 8 -- keep 8 lines visible above/below cursor
vim.o.updatetime = 250 -- faster CursorHold for diagnostics/hover
vim.o.signcolumn = "yes" -- always show signcolumn to prevent layout shift
