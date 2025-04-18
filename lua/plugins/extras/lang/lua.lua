local utils = require("utils")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = utils.merge_with_unique_lists({
      ensure_installed = {
        "lua",
        "luadoc",
      },
    }),
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = utils.merge_with_unique_lists({
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "luacheck",
      },
    }),
  },

  {
    "mfussenegger/nvim-lint",
    opts = utils.merge_with_unique_lists({
      linters_by_ft = {
        lua = { "luacheck" },
      },
    }),
  },

  {
    "neovim/nvim-lspconfig",
    opts = utils.merge_with_unique_lists({
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = {
                enable = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      },
    }),
  },
}
