local modules_config = require("config.modules")
local Registry = require("modules.registry")

local packs, setups = {}, {}

for _, mod_conf in ipairs(modules_config) do
  if mod_conf.enable then
    local mod = require(mod_conf.import)
    if mod.packs then vim.list_extend(packs, mod.packs) end
    if mod.setup then table.insert(setups, mod.setup) end
  end
end

vim.pack.add(packs)

for _, setup in ipairs(setups) do
  setup()
end

Registry.emit("mason:ready", Registry.get("mason_tools"))
Registry.emit("lsp:ready", Registry.get("lsp_servers"))