local modules_config = require("config.modules")

local M = {}

M.servers = {}

local map = vim.keymap.set

M.setup = function()
  for _, mod_conf in ipairs(modules_config) do
    if mod_conf.enable then
      local mod = require(mod_conf.import)
      if mod.lsp_servers then
        vim.list_extend(M.servers, mod.lsp_servers)
      end
    end
  end

  for _, server_name in ipairs(M.servers) do
    vim.lsp.enable(server_name)
  end

  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)

      if client then
        -- Enable completion
        if client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
          vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
          vim.lsp.completion.enable(true, client.id, buffer, { autotrigger = true })
          map(
            'i',
            '<C-Space>',
            function()
              vim.lsp.completion.get()
            end,
            { desc = "Trigger lsp completion" }
          )
        end

        -- Enable LLM-based inline completion
        if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlineCompletion) then
          vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
          vim.lsp.inline_completion.enable(true)
          map(
            "i",
            "<Tab>",
            function()
              if not vim.lsp.inline_completion.get() then
                return "<Tab>"
              end
            end,
            {
              expr = true,
              replace_keycodes = true,
              desc = "Get the current inline completion",
            })
        end

        -- Add normal-mode keymappings for signature help
        if client:supports_method('textDocument/signatureHelp') then
          map(
            'n',
            '<C-s>',
            function()
              vim.lsp.buf.signature_help()
            end,
            { desc = "Trigger lsp signature help" }
          )
        end

        -- Auto-format on save
        if client:supports_method('textDocument/formatting') then
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = buffer,
            callback = function()
              vim.lsp.buf.format({ bufnr = buffer, id = client.id })
            end,
          })
        end
      end
    end,
  })

  vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  })
end

return M
