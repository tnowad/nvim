local utils = require("utils")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = utils.merge_with_unique_lists({
      ensure_installed = {
        "typescript",
        "tsx",
        "javascript",
        "jsdoc",
      },
    }),
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = utils.merge_with_unique_lists({
      ensure_installed = { "prettierd", "eslint_d", "typescript-language-server" },
    }),
  },

  {
    "stevearc/conform.nvim",
    opts = utils.merge_with_unique_lists({
      formatters_by_ft = {
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        javascriptreact = { "prettierd" },
      },
    }),
  },

  {
    "mfussenegger/nvim-lint",
    opts = utils.merge_with_unique_lists({
      linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        javascriptreact = { "eslint_d" },
      },
    }),
  },

  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = utils.merge_with_unique_lists({
      settings = {
        code_lens_mode = "all",
        publish_diagnostic_mode = "insert_leave",
        default_format_options = {
          insertSpaceAfterCommaDelimiter = true,
          insertSpaceAfterConstructor = false,
          insertSpaceAfterSemicolonInForStatements = true,
          insertSpaceBeforeAndAfterBinaryOperators = true,
          insertSpaceAfterKeywordsInControlFlowStatements = true,
          insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
          insertSpaceBeforeFunctionParenthesis = false,
          insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = false,
          insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
          insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
          insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = true,
          insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = false,
          insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = false,
          insertSpaceAfterTypeAssertion = false,
          placeOpenBraceOnNewLineForFunctions = false,
          placeOpenBraceOnNewLineForControlBlocks = false,
          semicolons = "ignore",
          indentSwitchCase = true,
        },
        tsserver_plugins = {},
        tsserver_max_memory = "auto",
        tsserver_logs = "off",
        tsserver_log_level = "off",
        tsserver_locale = "en",
        tsserver_format_options = {},
        tsserver_file_preferences = {},
        separate_diagnostic_server = true,
        publish_diagnostic_on = "insert_leave",
        plugin_name = "tsserver",
        jsx_close_tag = { enable = false, filetypes = { "javascriptreact", "typescriptreact" } },
        include_completions_with_insert_text = true,
        expose_as_code_action = { "add_missing_imports", "fix_all", "remove_unused", "remove_unused_imports" },
        disable_member_code_lens = true,
        complete_function_calls = false,
        code_lens = "off",
      },
    }),
  },
}
