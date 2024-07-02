return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",

  ---@type ibl.config
  opts = {
    enabled = true,
    debounce = 200,
    indent = {
      char = "|",
    },
    whitespace = {
      highlight = {
        "Whitespace",
        "NonText",
      },
    },
  },
}
