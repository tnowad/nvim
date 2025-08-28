local modules_config = require("config.modules")

local packs, setups = {}, {}

for _, mod_conf in ipairs(modules_config) do
  if mod_conf.enable then
    local success, mod = pcall(require, mod_conf.import)
    if not success then
      vim.notify("Failed to load module: " .. mod_conf.import, vim.log.levels.ERROR)
    else
      if type(mod.packs) == "table" then vim.list_extend(packs, mod.packs) end
      if type(mod.setup) == "function" then table.insert(setups, mod.setup) end
    end
  end
end

vim.pack.add(packs)

for _, setup in ipairs(setups) do
  setup()
end

vim.api.nvim_exec_autocmds("User", {
  pattern = "ModulesReady",
  modeline = false,
})
