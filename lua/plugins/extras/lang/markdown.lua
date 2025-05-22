local utils = require("utils")


vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.md", "*.markdown" },
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    local changed = false

    for i, line in ipairs(lines) do
      if line:find("[“”‘’]") then
        local new_line = line
            :gsub("“", '"')
            :gsub("”", '"')
            :gsub("‘", "'")
            :gsub("’", "'")
        if new_line ~= line then
          lines[i] = new_line
          changed = true
        end
      end
    end

    if changed then
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    end
  end,
})

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = utils.merge_with_unique_lists({
      ensure_installed = {
        "markdown",
        "markdown_inline",
      },
    }),
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = utils.merge_with_unique_lists({
      ensure_installed = {
        "prettierd",
        "markdownlint",
        "marksman",
        "harper-ls",
      },
    }),
  },

  {
    "stevearc/conform.nvim",
    opts = utils.merge_with_unique_lists({
      formatters_by_ft = {
        markdown = { "prettierd" },
      },
    }),
  },

  {
    "mfussenegger/nvim-lint",
    opts = utils.merge_with_unique_lists({
      linters_by_ft = {
        markdown = { "markdownlint" },
      },
    }),
  },

  {
    "neovim/nvim-lspconfig",
    opts = utils.merge_with_unique_lists({
      servers = {
        marksman = {},
        harper_ls = {},
      },
    }),
  },

}
