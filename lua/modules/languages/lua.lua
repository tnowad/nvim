local M = {}

M.mason_tools = { "lua-language-server" }

M.lsp_servers = { "lua_ls" }

M.setup = function()
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
end

return M
