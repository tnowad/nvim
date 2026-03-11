local q = vim.treesitter.query
if q and q.add_directive then
  pcall(q.add_directive, "set-lang-from-info-string!", function() end)
end

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("plugins")
