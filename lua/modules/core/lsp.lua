local Registry = require("modules.registry")

local M = {}

local map = vim.keymap.set

M.setup = function()
  Registry.on("lsp:ready", function(servers)
    for _, server in ipairs(servers) do
      vim.lsp.enable(server)
    end
  end)

  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)

      if client then
        Registry.emit("lsp_ready", client.name)
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
