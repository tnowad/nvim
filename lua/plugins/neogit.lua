return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",

    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("neogit").setup({
      disable_signs = false,
      disable_context_highlighting = false,
      disable_commit_confirmation = false,
      disable_builtin_notifications = false,
      commit_popup = {
        kind = "split",
      },
      integrations = {
        diffview = true,
      },
    })

    vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>Neogit<CR>", { noremap = true, silent = true })
  end,
}
