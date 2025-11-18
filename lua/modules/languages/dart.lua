local utils = require("utils")
local M = {}

M.setup = function()
  vim.g.lsp_servers = utils.add_unique(vim.g.lsp_servers, "dartls")

  vim.lsp.config('dartls', {
    cmd = { 'dart', 'language-server', '--protocol=lsp' },
    filetypes = { 'dart' },
    root_markers = { 'pubspec.yaml' },
    init_options = {
      onlyAnalyzeProjectsWithOpenFiles = true,
      suggestFromUnimportedLibraries = true,
      closingLabels = true,
      outline = true,
      flutterOutline = true,
    },
    settings = {
      dart = {
        completeFunctionCalls = true,
        showTodos = true,
      },
    },
  })
end

return M
