return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      skip_confirm_for_simple_edits = false,
      view_options = {
        show_hidden = true,
      },

      win_options = {
        signcolumn = "yes:2",
      },
    },

    keys = {
      {
        "-",
        "<cmd>Oil<CR>",
        desc = "Oil: Open File Explorer",
        mode = { "n", "x" },
      },
    },
    lazy = false,
  },
  {
    "refractalize/oil-git-status.nvim",

    dependencies = {
      "stevearc/oil.nvim",
    },

    config = true,
  },
}
