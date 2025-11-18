return {
  -- Core editor infra
  { name = "mini",           import = "modules.core.mini",                enable = true },
  { name = "oil",            import = "modules.core.oil",                 enable = true },
  { name = "blink",          import = "modules.core.blink",               enable = true },
  { name = "mason",          import = "modules.core.mason",               enable = true },
  { name = "lsp",            import = "modules.core.lsp",                 enable = true },
  { name = "dap",            import = "modules.core.dap",                 enable = true },
  { name = "colorscheme",    import = "modules.core.colorscheme",         enable = true },
  { name = "treesitter",     import = "modules.core.treesitter",          enable = true },
  { name = "telescope",      import = "modules.core.telescope",           enable = true },

  -- Language modules
  { name = "json",           import = "modules.languages.json",           enable = true },
  { name = "lua",            import = "modules.languages.lua",            enable = true },
  { name = "gopls",          import = "modules.languages.gopls",          enable = true },
  { name = "pyright",        import = "modules.languages.pyright",        enable = true },
  { name = "typescript",     import = "modules.languages.typescript",     enable = true },
  { name = "dart",           import = "modules.languages.dart",           enable = true },
  { name = "typescript_dap", import = "modules.languages.typescript_dap", enable = true },
  { name = "eslint",         import = "modules.tools.eslint",             enable = false },

  -- Extras / AI
  { name = "copilot",        import = "modules.ai.copilot",               enable = true },
}
