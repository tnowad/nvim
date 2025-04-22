local utils = require("utils")

return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = utils.merge_with_unique_lists({
      ensure_installed = {
        "tailwindcss",
      },
    }),
  },

  {
    "neovim/nvim-lspconfig",
    opts = utils.merge_with_unique_lists({
      servers = {
        tailwindcss = {
          filetypes = {
            'javascript',
            'javascriptreact',
            'typescript',
            'typescriptreact',
          },
          root_dir = function(fname)
            -- HACK: return the current working directory for tailwind monorepo
            -- https://github.com/tailwindlabs/tailwindcss-intellisense/issues/1338
            return vim.fn.getcwd()
          end,
          settings = {
            tailwindCSS = {
              validate = true,
              lint = {
                cssConflict = 'warning',
                invalidApply = 'error',
                invalidScreen = 'error',
                invalidVariant = 'error',
                invalidConfigPath = 'error',
                invalidTailwindDirective = 'error',
                recommendedVariantOrder = 'warning',
              },
              classAttributes = {
                'class',
                'className',
                'class:list',
                'classList',
                'ngClass',
              },
              includeLanguages = {
                css = 'css',
                javascript = 'javascript',
                javascriptreact = 'javascript',
                typescript = 'javascript',
                typescriptreact = 'javascript',
              },
            },
          },
        },
      },
    }),
  },
}
