return {
  {
    'zbirenbaum/copilot.lua',
    dependencies = {
      'hrsh7th/nvim-cmp',
    },
    cmd = 'Copilot',
    build = ':Copilot auth',
    event = { 'InsertEnter', 'LspAttach' },
    config = function()
      require('copilot').setup {
        panel = {
          enabled = true,
          auto_refresh = true,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept_word = false,
            accept_line = false,
            accept = '<C-S-y>',
            next = '<C-n>',
            prev = '<C-p>',
            dismiss = '<C-\\>',
          },
        },
      }
    end,
  },
}
