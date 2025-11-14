local M = {}

M.packs = {
  { src = 'https://github.com/rktjmp/lush.nvim' },
  { src = 'https://github.com/t184256/vim-boring' }
}

M.setup = function()
  vim.cmd.colorscheme("boring")
end

return M
