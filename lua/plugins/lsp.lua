vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd("LspDetach", {
        group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
        end,
      })
    end
  end,
})

---@type LazyPluginSpec
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },

  dependencies = {
    { "williamboman/mason.nvim", config = true },
    { "williamboman/mason-lspconfig.nvim" },
    { "j-hui/fidget.nvim", opts = {} },
    { "folke/lazydev.nvim", opts = {} },
    { "saghen/blink.cmp" },
  },

  opts = {
    servers = {},
    capabilities = {
      textDocument = {
        completion = {
          completionItem = {
            snippetSupport = true,
          },
        },
      },
    },
  },

  keys = {
    {
      "K",
      "<cmd>lua vim.lsp.buf.hover()<CR>",
      desc = "Hover Documentation",
    },
    {
      "gD",
      "<cmd>lua vim.lsp.buf.declaration()<CR>",
      desc = "Go to [D]eclaration",
    },
    {
      "<leader>rn",
      "<cmd>lua vim.lsp.buf.rename()<CR>",
      desc = "[R]ename",
    },
    {
      "<leader>ca",
      "<cmd>lua vim.lsp.buf.code_action()<CR>",
      desc = "[C]ode [A]ction",
    },
    {
      "<leader>cf",
      "<cmd>lua vim.lsp.buf.format()<CR>",
      desc = "[C]ode [F]ormat",
    },
    {
      "<leader>cd",
      "<cmd>lua vim.diagnostic.open_float()<CR>",
      desc = "[C]ode [D]iagnostics",
    },
  },

  config = function(_, opts)
    local lspconfig = require("lspconfig")
    local servers = opts.servers or {}
    local capabilities = opts.capabilities or {}

    require("mason-lspconfig").setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = require("blink.cmp").get_lsp_capabilities(
            vim.tbl_deep_extend("force", capabilities, server.capabilities or {})
          )
          lspconfig[server_name].setup(server)
        end,
      },
    })
  end,
}
