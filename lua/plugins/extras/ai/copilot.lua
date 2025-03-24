return {
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    cmd = "Copilot",
    build = ":Copilot auth",
    event = { "InsertEnter" },
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "bottom",
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = false,
          hide_during_completion = true,
          debounce = 75,
          trigger_on_accept = true,
          keymap = {
            accept = "<C-A-l>",
            accept_word = false,
            accept_line = false,
            next = "<C-A-]>",
            prev = "<C-A-[>",
            dismiss = "<C-A-d>",
          },
        },
        filetypes = {
          gitcommit = true,
          markdown = true,
        },
      })
    end,
  },
}
