return {
  "numToStr/Comment.nvim",
  opts = {},
  setup = function()
    require("Comment").setup({
      pre_hook = function(c) end,
    })
  end,
}
