local utils = require("utils")

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  opts = utils.merge_with_unique_lists({
    ensure_installed = {},
    auto_install = false,
    highlight = {
      enable = false,
    },
    indent = { enable = true },
  }),

  config = function(_, opts)
    require("nvim-treesitter.install").prefer_git = true
    require("nvim-treesitter.configs").setup(opts)
  end,
}
