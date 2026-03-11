pcall(function()
---@diagnostic disable-next-line: missing-fields
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      'lua','python','go','gomod','gowork',
      'markdown','yaml','json','bash','fish',
      'dockerfile','javascript','typescript','astro'
    },
    highlight = { enable = true },
    indent = { enable = true },
  })
end)
