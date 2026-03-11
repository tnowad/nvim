vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/folke/neodev.nvim",
  "https://github.com/hrsh7th/nvim-cmp",
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/echasnovski/mini.nvim",
})

pcall(function()
  require("oil").setup({
    default_file_explorer = true,
    columns = { "icon","permissions","size","mtime" },
    win_options = { signcolumn = "no" },
  })
end)

require("plugins.treesitter")
require("plugins.lsp")
require("plugins.telescope")
require("plugins.git")
