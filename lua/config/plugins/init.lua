local plugins = {
  "config.plugins.pick",
  "config.plugins.mason",
  "config.plugins.oil",
  "config.plugins.blink",
}

local packs = {
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
}

for _, mod_name in ipairs(plugins) do
  local m = require(mod_name)
  if m.packs then
    vim.list_extend(packs, m.packs)
  end
end

vim.pack.add(packs)

for _, mod_name in ipairs(plugins) do
  local m = require(mod_name)
  if m.setup then
    m.setup()
  end
end
