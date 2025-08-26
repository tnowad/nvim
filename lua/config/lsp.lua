local modules_config = require("config.modules")

local servers = {}

for _, mod_conf in ipairs(modules_config) do
  if mod_conf.enable then
    local mod = require(mod_conf.import)
    if mod.lsp_servers then
      vim.list_extend(servers, mod.lsp_servers)
    end
  end
end

for _, server_name in ipairs(servers) do
  vim.lsp.enable(server_name)
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local opts = { buffer = bufnr }

    local map = vim.keymap.set
    map('n', 'gd', vim.lsp.buf.definition, opts)
    map('n', 'K', vim.lsp.buf.hover, opts)
    map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  end,
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = true,
})
