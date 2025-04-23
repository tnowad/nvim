return {
  {
    "echasnovski/mini.ai",
    opts = {
      n_lines = 500,
    },
  },
  {
    "echasnovski/mini.pairs",
    opts = {
      mappings = {
        ["("] = { action = "open", pair = "()" },
        ["["] = { action = "open", pair = "[]" },
        ["{"] = { action = "open", pair = "{}" },
      },
    },
  },
  { 'echasnovski/mini.comment' },
}
