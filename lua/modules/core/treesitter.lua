local M = {}

M.packs = {
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
}

M.setup = function()
  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "query",
      "typescript",
      "javascript",
      "go",
      "rust",
    },
    highlight = { enable = true },
    indent = { enable = true },
  })
end

return M
