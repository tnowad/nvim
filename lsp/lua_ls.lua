return {
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
        globals = { 'vim' },
      },

    },
  },
}
