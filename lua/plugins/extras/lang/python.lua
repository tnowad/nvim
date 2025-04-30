local utils = require("utils")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = utils.merge_with_unique_lists({
      ensure_installed = {
        "python",
      },
    }),
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = utils.merge_with_unique_lists({
      ensure_installed = {
        "black",   -- formatter
        "ruff",    -- linter
        "pyright", -- LSP
      },
    }),
  },

  {
    "stevearc/conform.nvim",
    opts = utils.merge_with_unique_lists({
      formatters_by_ft = {
        python = { "black" },
      },
    }),
  },

  {
    "mfussenegger/nvim-lint",
    opts = utils.merge_with_unique_lists({
      linters_by_ft = {
        python = { "ruff" },
      },
    }),
  },

  {
    "neovim/nvim-lspconfig",
    opts = utils.merge_with_unique_lists({
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic", -- or "strict"
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
      },
    }),
  },
}
