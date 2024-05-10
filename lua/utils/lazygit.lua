local M = {}

M.open = function()
  local terminal = require('toggleterm.terminal').Terminal
  local lazygit = terminal:new {
    cmd = 'lazygit',
    hidden = true,
    direction = 'float',
    float_opts = { border = 'single' },
  }
  lazygit:toggle()
end

return M
