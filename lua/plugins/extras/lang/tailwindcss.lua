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
            'aspnetcorerazor',
            'astro',
            'astro-markdown',
            'blade',
            'clojure',
            'django-html',
            'htmldjango',
            'edge',
            'eelixir', -- vim ft
            'elixir',
            'ejs',
            'erb',
            'eruby', -- vim ft
            'gohtml',
            'gohtmltmpl',
            'haml',
            'handlebars',
            'hbs',
            'html',
            'htmlangular',
            'html-eex',
            'heex',
            'jade',
            'leaf',
            'liquid',
            'markdown',
            'mdx',
            'mustache',
            'njk',
            'nunjucks',
            'php',
            'razor',
            'slim',
            'twig',
            -- css
            'css',
            'less',
            'postcss',
            'sass',
            'scss',
            'stylus',
            'sugarss',
            -- js
            'javascript',
            'javascriptreact',
            'reason',
            'rescript',
            'typescript',
            'typescriptreact',
            -- mixed
            'vue',
            'svelte',
            'templ',
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
                svelte = 'html',
                vue = 'html',
                html = 'html',
                php = 'html',
                eelixir = 'html-eex',
                eruby = 'erb',
                rust = 'html',
              },
            },
          },
        },
      },
    }),
  },
}
