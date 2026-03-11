pcall(function()
  require("neodev").setup({})
end)
local capabilities
local ok_cmp, cmp = pcall(require, "cmp")

if ok_cmp then
  local ok_lsp, cmp_lsp = pcall(require, "cmp_nvim_lsp")

  cmp.setup({
    mapping = cmp.mapping.preset.insert(),
    sources = { { name = "nvim_lsp" } }
  })

  if ok_lsp then
    capabilities = cmp_lsp.default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )
  end
end

if not capabilities then
  capabilities = vim.lsp.protocol.make_client_capabilities()
end

local lsp = vim.lsp

lsp.enable("pyright")

lsp.config("bashls",{ capabilities = capabilities })
lsp.enable("bashls")

lsp.config("taplo",{ capabilities = capabilities })
lsp.config("jsonls",{ capabilities = capabilities })
lsp.enable("jsonls")

lsp.config("yamlls",{ capabilities = capabilities })
lsp.enable("yamlls")

lsp.config("dockerls",{ capabilities = capabilities })
lsp.enable("dockerls")

lsp.config("vtsls",{ capabilities = capabilities })
lsp.enable("vtsls")

lsp.config("astro",{
  capabilities = capabilities,
  init_options = { typescript = {} }
})
lsp.enable("astro")
