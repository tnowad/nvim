local utils = require("utils")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = utils.merge_with_unique_lists({
      ensure_installed = {
        "fish",
      },
    }),
  },
}
