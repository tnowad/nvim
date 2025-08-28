local Auth = require("modules.ai.copilot.auth")
local utils = require("utils")

local M = {}

function M.setup()
  utils.add_unique(vim.g.mason_tools, "copilot-language-server")
  utils.add_unique(vim.g.lsp_servers, "copilot")

  vim.lsp.config('copilot', {
    cmd = { 'copilot-language-server', '--stdio' },
    root_markers = { '.git' },
    init_options = {
      editorInfo = { name = 'Neovim', version = tostring(vim.version()) },
      editorPluginInfo = { name = 'Neovim', version = tostring(vim.version()) },
    },
    settings = { telemetry = { telemetryLevel = 'off' } },
    on_attach = function(client, bufnr)
      vim.api.nvim_buf_create_user_command(bufnr, 'LspCopilotSignIn',
        function() Auth.sign_in(bufnr, client) end,
        { desc = 'Sign in Copilot with GitHub' })
      vim.api.nvim_buf_create_user_command(bufnr, 'LspCopilotSignOut',
        function() Auth.sign_out(bufnr, client) end,
        { desc = 'Sign out Copilot with GitHub' })
    end,
  })
end

return M
