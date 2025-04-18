local utils = require("utils")

return {
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = utils.merge_with_unique_lists({
      auto_update = true,
      run_on_start = true,
      run_on_config = true,
    }),
  },
}
