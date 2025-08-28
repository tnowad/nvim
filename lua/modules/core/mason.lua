local M = {}

M.packs = {
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
}

M.setup = function()
  vim.api.nvim_create_autocmd("User", {
    pattern = "ModulesReady",
    callback = function()
      require("mason").setup()
      require("mason-tool-installer").setup({
        ensure_installed = vim.g.mason_tools or {},
        auto_update = true,
        run_on_start = true,
      })
    end,
  })
end

return M
