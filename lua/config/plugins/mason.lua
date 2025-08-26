local modules_config = require("config.modules")

local M = {}

M.packs = {
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
}

M.tools = {}

M.setup = function()
  require("mason").setup()

  for _, mod_conf in ipairs(modules_config) do
    if mod_conf.enable then
      local mod = require(mod_conf.import)
      if mod.mason_tools then
        vim.list_extend(M.tools, mod.mason_tools)
      end
      if mod.setup then
        mod.setup()
      end
    end
  end

  local unique_tools = {}
  for _, tool in ipairs(M.tools) do
    unique_tools[tool] = true
  end
  M.tools = vim.tbl_keys(unique_tools)

  require("mason-tool-installer").setup({
    ensure_installed = M.tools,
    auto_update = true,
    run_on_start = true,
  })
end

return M
