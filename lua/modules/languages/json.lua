local utils = require("utils")
local M = {}

M.setup = function()
  vim.g.mason_tools = utils.add_unique(vim.g.mason_tools, "json-lsp")
  vim.g.lsp_servers = utils.add_unique(vim.g.lsp_servers, "json-lsp")

  vim.lsp.config('json-lsp', {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' },
  init_options = {
    provideFormatter = true,
  },
  root_markers = { '.git' },
})

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.json" },
    callback = function()
      vim.lsp.buf.format({ async = true })
    end,
  })
end

return M
