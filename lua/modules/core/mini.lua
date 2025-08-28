local M = {}

M.packs = {
  { src = 'https://github.com/echasnovski/mini.nvim' },
}

M.setup = function()
  local pick = require("mini.pick")
  pick.setup()

  vim.keymap.set('n', '<leader>sf', ':Pick files<CR>', { desc = 'Search files' })
  vim.keymap.set('n', '<leader>sh', ':Pick help<CR>', { desc = 'Search help' })
  vim.keymap.set('n', '<leader>sg', ':Pick grep_live<CR>', { desc = 'Search grep' })

  require("mini.ai").setup()
  require("mini.pairs").setup()
  require("mini.bracketed").setup()
  require("mini.cursorword").setup({ delay = 0 })
  require("mini.indentscope").setup({
    draw = {
      delay = 0,
      animation = function() return 0 end,
    },
  })

  local miniclue = require("mini.clue")
  miniclue.setup({
    triggers = {
      -- Leader triggers
      { mode = 'n', keys = '<Leader>' },
      { mode = 'x', keys = '<Leader>' },

      -- Built-in completion
      { mode = 'i', keys = '<C-x>' },

      -- `g` key
      { mode = 'n', keys = 'g' },
      { mode = 'x', keys = 'g' },

      -- Marks
      { mode = 'n', keys = "'" },
      { mode = 'n', keys = '`' },
      { mode = 'x', keys = "'" },
      { mode = 'x', keys = '`' },

      -- Registers
      { mode = 'n', keys = '"' },
      { mode = 'x', keys = '"' },
      { mode = 'i', keys = '<C-r>' },
      { mode = 'c', keys = '<C-r>' },

      -- Window commands
      { mode = 'n', keys = '<C-w>' },

      -- `z` key
      { mode = 'n', keys = 'z' },
      { mode = 'x', keys = 'z' },
    },

    clues = {
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers(),
      miniclue.gen_clues.windows(),
      miniclue.gen_clues.z(),
    },
  })
end

return M
