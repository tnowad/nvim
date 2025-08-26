local M = {}

M.packs = {
  { src = 'https://github.com/stevearc/oil.nvim' },
}

M.setup = function()
  require("oil").setup()
  vim.keymap.set('n', '-', ':Oil<CR>')
end

return M
