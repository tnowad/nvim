local utils = require "utils"

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = utils.merge_with_unique_lists({
      ensure_installed = {
        "bibtex",
        "latex",
      },
      highlight = {
        enable = true,
        disable = { "latex", "bibtex" },
      },
    }),
  },

  {
    "lervag/vimtex",
    lazy = false,
    config = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_mappings_disable = { ["n"] = { "K" } }
      vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
      vim.g.vimtex_syntax_enabled = 0
    end,
    keys = {
      { "<localLeader>l", "", desc = "+vimtex", ft = "tex" },
    },
  },


  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = utils.merge_with_unique_lists({
      ensure_installed = {
        "texlab",
        "tex-fmt",
      },
    }),
  },

  {
    "stevearc/conform.nvim",
    opts = utils.merge_with_unique_lists({
      formatters_by_ft = {
        tex = { "tex-fmt" },
        bib = { "tex-fmt" },
      },
    }),
  },

  {
    "neovim/nvim-lspconfig",
    opts = utils.merge_with_unique_lists({
      servers = {
        texlab = {
          keys = {
            { "<Leader>K", "<plug>(vimtex-doc-package)", desc = "Vimtex Docs", silent = true },
          },
        },
      },
    }),
  },
}
