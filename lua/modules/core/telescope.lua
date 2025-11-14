local M = {}

M.packs = {
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
}

M.setup = function()
  local telescope = require('telescope')
  local actions = require('telescope.actions')
  local builtin = require('telescope.builtin')

  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ['<esc>'] = actions.close,
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  })

  telescope.load_extension('fzf')

  -- keymaps
  vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Telescope find files' })
  vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Telescope live grep' })
  vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Telescope buffers' })
  vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Telescope help tags' })

  -- git
  vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Git status' })
  vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Git commits' })
  vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Git branches' })

  -- search
  vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Resume last search' })
  vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Search keymaps' })
  vim.keymap.set('n', '<leader>sm', builtin.marks, { desc = 'Search marks' })
  vim.keymap.set('n', '<leader>so', builtin.oldfiles, { desc = 'Search old files' })

  -- lsp (if you use built-in LSP)
  vim.keymap.set('n', '<leader>sd', builtin.lsp_definitions, { desc = 'LSP definitions' })
  vim.keymap.set('n', '<leader>sr', builtin.lsp_references, { desc = 'LSP references' })
  vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols, { desc = 'LSP document symbols' })
  vim.keymap.set('n', '<leader>sS', builtin.lsp_workspace_symbols, { desc = 'LSP workspace symbols' })

  -- misc
  vim.keymap.set('n', '<leader>sq', builtin.quickfix, { desc = 'Quickfix list' })
  vim.keymap.set('n', '<leader>sj', builtin.jumplist, { desc = 'Jump list' })
end

return M
