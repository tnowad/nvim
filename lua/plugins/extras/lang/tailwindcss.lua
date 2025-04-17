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
          root_dir = require('lspconfig').util.root_pattern(
            'tailwind.config.js',
            'tailwind.config.cjs',
            'tailwind.config.mjs',
            'tailwind.config.ts',
            'postcss.config.js',
            'postcss.config.cjs',
            'postcss.config.mjs',
            'postcss.config.ts'
          ),
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
