local utils = require("utils")

return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = utils.merge_with_unique_lists({
      ensure_installed = {
        "tailwindcss-language-server",
      },
    }),
  },

  {
    "neovim/nvim-lspconfig",
    opts = utils.merge_with_unique_lists({
      servers = {
        tailwindcss = {
          init_options = {
            userLanguages = {
              typescriptreact = "javascript",
              javascriptreact = "javascript",
            },
          },
        },
      },
    }),
  },
}
