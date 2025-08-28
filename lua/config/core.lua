local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorcolumn = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.incsearch = true
opt.completeopt = { "menu", "menuone", "noselect" }

vim.g.mapleader = ' '

local map = vim.keymap.set

map('n', '<leader>o', ':update<CR>:source<CR>')
map('n', '<leader>q', ':q<CR>')
map('n', '<leader>w', ':w<CR>')
map({ 'n', 'v', 'x' }, '<leader>d', ':"+d<CR>')
map({ 'n', 'v', 'x' }, '<leader>y', ':"+y<CR>')

map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

map('n', '<C-h>', '<C-w><C-h>')
map('n', '<C-l>', '<C-w><C-l>')
map('n', '<C-j>', '<C-w><C-j>')
map('n', '<C-k>', '<C-w><C-k>')

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})
