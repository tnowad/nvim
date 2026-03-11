-- go format on save
vim.api.nvim_create_autocmd("BufWritePre",{
  pattern="*.go",
  callback=function()
    vim.lsp.buf.format({
      async=false,
      filter=function(client)
        return client.name=="gopls"
      end
    })
  end
})
