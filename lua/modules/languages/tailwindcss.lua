local utils = require("utils")

local M = {}

M.setup = function()
  vim.g.mason_tools = utils.add_unique(vim.g.mason_tools, "tailwindcss-language-server")
  vim.g.lsp_servers = utils.add_unique(vim.g.lsp_servers, "tailwindcss")

  vim.lsp.config('tailwindcss', {
    cmd = { 'tailwindcss-language-server', '--stdio' },
    filetypes = {
      'aspnetcorerazor', 'astro', 'astro-markdown', 'blade', 'clojure', 'django-html',
      'htmldjango', 'edge', 'eelixir', 'elixir', 'ejs', 'erb', 'eruby', 'gohtml',
      'gohtmltmpl', 'haml', 'handlebars', 'hbs', 'html', 'htmlangular', 'html-eex',
      'heex', 'jade', 'leaf', 'liquid', 'markdown', 'mdx', 'mustache', 'njk',
      'nunjucks', 'php', 'razor', 'slim', 'twig', 'css', 'less', 'postcss',
      'sass', 'scss', 'stylus', 'sugarss', 'javascript', 'javascriptreact',
      'reason', 'rescript', 'typescript', 'typescriptreact', 'vue', 'svelte', 'templ',
    },
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
        classAttributes = { 'class', 'className', 'class:list', 'classList', 'ngClass' },
        includeLanguages = {
          eelixir = 'html-eex',
          elixir = 'phoenix-heex',
          eruby = 'erb',
          heex = 'phoenix-heex',
          htmlangular = 'html',
          templ = 'html',
        },
      },
    },
    before_init = function(_, config)
      config.settings = config.settings or {}
      config.settings.editor = config.settings.editor or {}
      if not config.settings.editor.tabSize then
        config.settings.editor.tabSize = vim.lsp.util.get_effective_tabstop()
      end
    end,
    workspace_required = true,
    root_dir = function(bufnr, on_dir)
      local root_files = {
        'tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.mjs', 'tailwind.config.ts',
        'postcss.config.js', 'postcss.config.cjs', 'postcss.config.mjs', 'postcss.config.ts',
        'theme/static_src/tailwind.config.js', 'theme/static_src/tailwind.config.cjs',
        'theme/static_src/tailwind.config.mjs', 'theme/static_src/tailwind.config.ts',
        'theme/static_src/postcss.config.js', '.git',
      }

      local fname = vim.api.nvim_buf_get_name(bufnr)

      -- Find first matching root file upwards
      local found = vim.fs.find(root_files, { path = fname, upward = true })[1]
      if found then
        on_dir(vim.fs.dirname(found))
      end
    end,
  })
end

return M
