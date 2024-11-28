return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {},
  config = function()
    require("typescript-tools").setup({
      --- @type Settings
      settings = {
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
}
