---@type LazyPluginSpec
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  ---@type wk.Opts
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    icons = {
      mappings = false,
    },
  },
}
