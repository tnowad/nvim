return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },

    opts = {},

    config = function(_, opts)
      local lint = require("lint")
      lint.linters_by_ft = opts.linters_by_ft or {}

      vim.api.nvim_create_autocmd(
        { "BufEnter", "BufWritePost", "InsertLeave" },
        {
          group = vim.api.nvim_create_augroup("lint", { clear = true }),
          callback = function() require("lint").try_lint() end,
        }
      )
    end,
  },
}
