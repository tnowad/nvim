---@type LazyPluginSpec
return {
  "folke/todo-comments.nvim",
  event = "VimEnter",
  dependencies = { "nvim-lua/plenary.nvim" },

  ---@type TodoOptions
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    signs = false,
  },
}
