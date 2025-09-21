local utils = require("utils")

local M = {}

M.setup = function()
  vim.g.mason_tools = utils.add_unique(vim.g.mason_tools, "eslint-lsp")
  vim.g.lsp_servers = utils.add_unique(vim.g.lsp_servers, "eslint")

  local eslint_config_files = {
    '.eslintrc',
    '.eslintrc.js',
    '.eslintrc.cjs',
    '.eslintrc.yaml',
    '.eslintrc.yml',
    '.eslintrc.json',
    'eslint.config.js',
    'eslint.config.mjs',
    'eslint.config.cjs',
    'eslint.config.ts',
    'eslint.config.mts',
    'eslint.config.cts',
  }

  vim.lsp.config('eslint', {
    cmd = { 'vscode-eslint-language-server', '--stdio' },
    filetypes = {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx',
      'vue',
      'svelte',
      'astro',
      'htmlangular',
    },
    workspace_required = true,
    on_attach = function(client, bufnr)
      vim.api.nvim_buf_create_user_command(0, 'LspEslintFixAll', function()
        client:request_sync('workspace/executeCommand', {
          command = 'eslint.applyAllFixes',
          arguments = {
            {
              uri = vim.uri_from_bufnr(bufnr),
              version = vim.lsp.util.buf_versions[bufnr],
            },
          },
        }, nil, bufnr)
      end, {})

      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        callback = function()
          if client.server_capabilities.executeCommandProvider then
            client:request_sync('workspace/executeCommand', {
              command = 'eslint.applyAllFixes',
              arguments = {
                {
                  uri = vim.uri_from_bufnr(bufnr),
                  version = vim.lsp.util.buf_versions[bufnr] or 0,
                },
              },
            }, nil, bufnr)
          end
        end,
      })
    end,
    root_dir = function(bufnr, on_dir)
      local root_markers = { 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb', 'bun.lock' }
      root_markers = vim.fn.has('nvim-0.11.3') == 1 and { root_markers } or root_markers
      local project_root = vim.fs.root(bufnr, root_markers)
      if not project_root then return end

      local filename = vim.api.nvim_buf_get_name(bufnr)
      local eslint_config_files_with_package_json = vim
          .iter(eslint_config_files)
          :map(function(file) return file end)
          :totable()
      table.insert(eslint_config_files_with_package_json, 'package.json')

      local is_buffer_using_eslint = vim.fs.find(eslint_config_files_with_package_json, {
        path = filename,
        type = 'file',
        limit = 1,
        upward = true,
        stop = vim.fs.dirname(project_root),
      })[1]
      if not is_buffer_using_eslint then return end

      on_dir(project_root)
    end,
    settings = {
      validate = 'on',
      packageManager = nil,
      useESLintClass = false,
      experimental = {
        useFlatConfig = false,
      },
      codeActionOnSave = {
        enable = false,
        mode = 'all',
      },
      format = true,
      quiet = false,
      onIgnoredFiles = 'off',
      rulesCustomizations = {},
      run = 'onType',
      problems = {
        shortenToSingleLine = false,
      },
      nodePath = '',
      workingDirectory = { mode = 'auto' },
      codeAction = {
        disableRuleComment = {
          enable = true,
          location = 'separateLine',
        },
        showDocumentation = { enable = true },
      },
    },
    before_init = function(_, config)
      local root_dir = config.root_dir
      if root_dir then
        config.settings = config.settings or {}
        config.settings.workspaceFolder = {
          uri = root_dir,
          name = vim.fn.fnamemodify(root_dir, ':t'),
        }

        local flat_config_files = vim.tbl_filter(function(file)
          return file:match('config')
        end, eslint_config_files)

        for _, file in ipairs(flat_config_files) do
          local found_files = vim.fn.globpath(root_dir, file, true, true)
          local filtered_files = {}
          for _, found_file in ipairs(found_files) do
            if not string.find(found_file, '[/\\]node_modules[/\\]') then
              table.insert(filtered_files, found_file)
            end
          end
          if #filtered_files > 0 then
            config.settings.experimental = config.settings.experimental or {}
            config.settings.experimental.useFlatConfig = true
            break
          end
        end

        local pnp_cjs = root_dir .. '/.pnp.cjs'
        local pnp_js = root_dir .. '/.pnp.js'
        if vim.uv.fs_stat(pnp_cjs) or vim.uv.fs_stat(pnp_js) then
          local cmd = config.cmd
          config.cmd = vim.list_extend({ 'yarn', 'exec' }, cmd)
        end
      end
    end,
    handlers = {
      ['eslint/openDoc'] = function(_, result)
        if result then vim.ui.open(result.url) end
        return {}
      end,
      ['eslint/confirmESLintExecution'] = function(_, result)
        if not result then return end
        return 4
      end,
      ['eslint/probeFailed'] = function()
        vim.notify('[lspconfig] ESLint probe failed.', vim.log.levels.WARN)
        return {}
      end,
      ['eslint/noLibrary'] = function()
        vim.notify('[lspconfig] Unable to find ESLint library.', vim.log.levels.WARN)
        return {}
      end,
    },
  })
end

return M
