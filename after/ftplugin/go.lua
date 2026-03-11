local lsp = vim.lsp
local capabilities

local ok_cmp = pcall(require, "cmp")
if ok_cmp then
  local ok_lsp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
  if ok_lsp then
    capabilities = cmp_lsp.default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )
  end
end

if not capabilities then
  capabilities = vim.lsp.protocol.make_client_capabilities()
end

lsp.config("gopls",{
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = { unusedparams = true, shadow = true },
      staticcheck = true,
    }
  }
})
lsp.enable("gopls")
