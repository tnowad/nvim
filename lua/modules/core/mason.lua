local Registry = require("modules.registry")

local M = {}

M.packs = {
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
}

M.setup = function()
  Registry.on("mason:ready", function(tools)
    require("mason").setup()
    require("mason-tool-installer").setup({
      ensure_installed = tools,
      auto_update = true,
      run_on_start = true,
    })
  end)
end

return M
