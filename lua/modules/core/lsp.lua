local M = {}
local map = vim.keymap.set

local function setup_completion(client, buffer)
  if client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
    vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
    vim.lsp.completion.enable(true, client.id, buffer, { autotrigger = true })
    map('i', '<C-Space>', vim.lsp.completion.get, { desc = "Trigger lsp completion" })
  end
end

local function setup_inline_completion(client)
  if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlineCompletion) then
    vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
    vim.lsp.inline_completion.enable(true)
    map("i", "<C-x><C-g>", function()
      if not vim.lsp.inline_completion.get() then return "<C-x><C-g>" end
    end, { expr = true, replace_keycodes = true, desc = "Accept inline completion" })
  end
end

local function setup_signature_help(client)
  if client:supports_method('textDocument/signatureHelp') then
    map('n', '<C-s>', vim.lsp.buf.signature_help, { desc = "Trigger lsp signature help" })
  end
end

local function setup_formatting(client, buffer)
  if client:supports_method('textDocument/formatting') then
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = buffer,
      callback = function()
        vim.lsp.buf.format({ bufnr = buffer, id = client.id })
      end,
    })
  end
end

M.setup = function()
  vim.api.nvim_create_autocmd("User", {
    pattern = "ModulesReady",
    callback = function()
      for _, server in ipairs(vim.g.lsp_servers or {}) do
        vim.lsp.enable(server)
      end
    end,
  })

  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if not client then return end

      setup_completion(client, buffer)
      setup_inline_completion(client)
      setup_signature_help(client)
      setup_formatting(client, buffer)
    end,
  })

  vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  })
end

return M
