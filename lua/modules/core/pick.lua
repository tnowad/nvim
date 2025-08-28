local M = {}

M.packs = {
  { src = 'https://github.com/echasnovski/mini.pick' },
}

M.setup = function()
  local pick = require("mini.pick")
  pick.setup()

  local opts = { silent = true, noremap = true }
  vim.keymap.set('n', '<leader>f', ':Pick files<CR>', opts)
  vim.keymap.set('n', '<leader>h', ':Pick help<CR>', opts)
end

return M
