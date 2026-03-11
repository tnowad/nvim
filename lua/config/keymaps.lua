pcall(function()
  local clue = require("mini.clue")

  clue.setup({
    triggers = {
      { mode='n', keys='<leader>' },
      { mode='x', keys='<leader>' },
      { mode='n', keys='g' },
      { mode='n', keys='[' },
      { mode='n', keys=']' },
    },
    clues = {
      { mode='n', keys='<leader>f', desc='find' },
      { mode='n', keys='<leader>s', desc='search' },
      { mode='n', keys='<leader>g', desc='git' },
      { mode='n', keys='<leader>b', desc='buffer' },

      { mode='n', keys='<leader>gs', desc='git stage' },
      { mode='n', keys='<leader>gr', desc='git reset' },
      { mode='n', keys='<leader>gp', desc='git preview' },
      { mode='n', keys='<leader>gb', desc='git blame' },
      { mode='n', keys='<leader>gd', desc='git diff' },
      { mode='n', keys='<leader>gt', desc='git toggle' },
      { mode='n', keys='<leader>gu', desc='git undo' },

      { mode='n', keys=']c', desc='next change' },
      { mode='n', keys='[c', desc='previous change' },
    }
  })
end)

vim.keymap.set("n","-","<cmd>Oil<CR>",{ desc="file explorer" })
