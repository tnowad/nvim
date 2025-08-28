local Registry = require("modules.registry")

local M = {}

M.setup = function()
  Registry.provide('mason_tools', { "lua-language-server" })
  Registry.provide('lsp_servers', { "lua_ls" })

  vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = {
      '.luarc.json',
      '.luarc.jsonc',
      '.luacheckrc',
      '.stylua.toml',
      'stylua.toml',
      'selene.toml',
      'selene.yml',
      '.git',
    },
    settings = {
      Lua = {
        workspace = {
          library = {
            vim.env.VIMRUNTIME,
            vim.fn.stdpath('config'),
            vim.fn.stdpath('data') .. '/site',
          },
          checkThirdParty = false,
        },
        diagnostics = {
          disable = { 'missing-field' },
          globals = { 'vim' },
        },
      },
    },
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.lua" },
    callback = function()
      vim.lsp.buf.format({ async = true })
    end,
  })

  Registry.on("lsp_ready", function(server)
    if server == "lua_ls" then
      vim.notify("Lua LSP attached!", vim.log.levels.INFO)
    end
  end)

end

return M
