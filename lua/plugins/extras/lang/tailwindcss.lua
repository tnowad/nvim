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
              experimental = {
                classRegex = {
                  'cn\\(([^)]*)\\)',
                  'clsx\\(([^)]*)\\)',
                  'cva\\(([^)]*)\\)',
                  'twMerge\\(([^)]*)\\)',
                }
              },
              validate = true,
              lint = {
                cssConflict = 'warning',
                invalidApply = 'error',
                invalidConfigPath = 'error',
                invalidScreen = 'error',
                invalidTailwindDirective = 'error',
                invalidVariant = 'error',
                recommendedVariantOrder = 'warning',
                unusedClasses = 'warning',
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
