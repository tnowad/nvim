local utils = require("utils")

---@type LazyPluginSpec[]
return {
  {
    "nvim-treesitter/nvim-treesitter",

    ---@param opts TSConfig
    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, {
        "typescript",
        "tsx",
        "javascript",
        "jsdoc",
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    ---@param opts MasonLspconfigSettings
    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "eslint" })
    end,
  },

  {
    "williamboman/mason.nvim",
    -- opts = function(_, opts)
    --   opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "prettier" })
    -- end,
    opts = { ensure_installed = { "prettier" } },
  },

  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    config = function()
      require("typescript-tools").setup({
        --- @type Settings
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
      })
    end,
  },
}
