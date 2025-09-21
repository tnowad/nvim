local utils = require("utils")
local M = {}

M.setup = function()
  local dap = require('dap')


  dap.adapters.node2 = {
    type = "executable",
    command = "node",
    args = { vim.fn.stdpath("data") .. "/lazy/mfussenegger_nvim-dap/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
  }

  dap.configurations.typescript = {
    {
      name = "Launch file",
      type = "node2",
      request = "launch",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      console = "integratedTerminal",
    },
    {
      name = "Attach to process",
      type = "node2",
      request = "attach",
      processId = require("dap.utils").pick_process,
    },
  }

  vim.keymap.set("n", "<Leader>da", function()
    require("dap").run({ type = "node2", request = "attach", processId = require("dap.utils").pick_process })
  end, { desc = "Attach to Node process" })
end

return M
