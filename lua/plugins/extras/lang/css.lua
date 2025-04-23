local utils = require("utils")

return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = utils.merge_with_unique_lists({
      ensure_installed = {
        "css-lsp",
      },
    }),
  },

  {
    "neovim/nvim-lspconfig",
    opts = utils.merge_with_unique_lists({
      servers = {
        cssls = {}
      },
    }),
  },

  {
    "stevearc/conform.nvim",
    opts = utils.merge_with_unique_lists({
      formatters_by_ft = {
        css = { "prettierd" },
        scss = { "prettierd" },
        less = { "prettierd" },
      },
    }),
  },
}
