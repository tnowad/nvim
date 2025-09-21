---@diagnostic disable: undefined-field
local M = {}

M.packs = {
  { src = 'https://github.com/mfussenegger/nvim-dap' },
  { src = 'https://github.com/nvim-neotest/nvim-nio' },
  { src = 'https://github.com/rcarriga/nvim-dap-ui' },
}

M.setup = function()
  local dap = require('dap')
  local dapui = require('dapui')
  dapui.setup()

  dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
  dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
  dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end


  local map = vim.keymap.set
  map('n', '<F5>', ':DapContinue<CR>', { desc = 'Start/Continue Debugging' })
  map('n', '<F10>', ':DapStepOver<CR>', { desc = 'Step Over' })
  map('n', '<F11>', ':DapStepInto<CR>', { desc = 'Step Into' })
  map('n', '<F12>', ':DapStepOut<CR>', { desc = 'Step Out' })
  map('n', '<Leader>b', ':DapToggleBreakpoint<CR>', { desc = 'Toggle Breakpoint' })
  map('n', '<Leader>du', dapui.toggle, { desc = 'Toggle DAP UI' })
end

return M
