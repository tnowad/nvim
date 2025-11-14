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
opt.wrap = false
opt.swapfile = false
opt.autoread = true


vim.g.mapleader = ' '

vim.g.mason_tools = {}
vim.g.lsp_servers = {}

local map = vim.keymap.set

map('n', '<leader>o', ':update<CR>:source<CR>')

map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Line diagnostics' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostics list' })
map('n', '<leader>fm', function() vim.lsp.buf.format { async = true } end, { desc = 'Format buffer' })

map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("git-commit-options", { clear = true }),
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.textwidth = 72
    vim.opt_local.spell = true
    vim.opt_local.colorcolumn = "50,72"
  end,
})


vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  group = vim.api.nvim_create_augroup("auto-reload-on-change", { clear = true }),
  callback = function()
    if vim.fn.getcmdwintype() == '' then
      vim.cmd('checktime')
    end
  end,
})
