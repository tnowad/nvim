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
          auto_refresh = true,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept_word = false,
            accept_line = false,
            accept = "<C-A-y>",
            next = "<C-A-n>",
            prev = "<C-A-p>",
            dismiss = "<C-A-\\>",
          },
        },
        filetypes = {
          gitcommit = true,
          markdown = true,
        },
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = false,
    },
  },
}
